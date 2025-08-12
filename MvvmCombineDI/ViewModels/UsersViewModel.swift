//
//  UsersViewModel.swift
//  MvvmCombineDI
//
//  Created by hazemhabeb on 12/08/2025.
//

import Combine
import Foundation

class UsersViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var users: [User] = []
    @Published var filteredUsers: [User] = []
    @Published var searchText = ""
    @Published var selectedDepartment: String?
    @Published var showActiveOnly = false
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    // MARK: - Computed Properties
    var departments: [String] {
        Array(Set(users.map(\.department))).sorted()
    }
    
    // MARK: - Private Properties
    private let userService: UserServiceProtocol
    private let cancelBag = CancelBag()
    
    // MARK: - Initialization
    init(userService: UserServiceProtocol) {
        self.userService = userService
        setupBindings()
        loadUsers()
    }
    
    // MARK: - Public Methods
    func loadUsers() {
        isLoading = true
        errorMessage = nil
        
        userService.fetchUsers()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] users in
                    self?.users = users
                }
            )
            .store(in: cancelBag)
    }
    
    func toggleUserStatus(_ user: User) {
        var updatedUser = user
        updatedUser.isActive.toggle()
        
        userService.updateUser(updatedUser)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] updatedUser in
                    self?.updateUserInList(updatedUser)
                }
            )
            .store(in: cancelBag)
    }
    
    func deleteUser(_ user: User) {
        userService.deleteUser(id: user.id)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] _ in
                    self?.users.removeAll { $0.id == user.id }
                }
            )
            .store(in: cancelBag)
    }
    
    func clearError() {
        errorMessage = nil
    }
    
    // MARK: - Private Methods
    private func setupBindings() {
        // Reactive filtering - combines all filter inputs
        Publishers.CombineLatest4(
            $users,
            $searchText.debounce(for: 0.3, scheduler: DispatchQueue.main),
            $selectedDepartment,
            $showActiveOnly
        )
        .map { users, searchText, department, activeOnly in
            self.filterUsers(users, searchText: searchText, department: department, activeOnly: activeOnly)
        }
        .assign(to: &$filteredUsers)
    }
    
    private func filterUsers(_ users: [User], searchText: String, department: String?, activeOnly: Bool) -> [User] {
        var result = users
        
        // Search filter
        if !searchText.isEmpty {
            result = result.filter { user in
                user.name.localizedCaseInsensitiveContains(searchText) ||
                user.email.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        // Department filter
        if let department = department {
            result = result.filter { $0.department == department }
        }
        
        // Active status filter
        if activeOnly {
            result = result.filter(\.isActive)
        }
        
        return result.sorted { $0.name < $1.name }
    }
    
    private func updateUserInList(_ user: User) {
        if let index = users.firstIndex(where: { $0.id == user.id }) {
            users[index] = user
        }
    }
}
