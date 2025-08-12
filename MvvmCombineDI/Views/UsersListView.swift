//
//  UsersListView.swift
//  MvvmCombineDI
//
//  Created by hazemhabeb on 12/08/2025.
//
import SwiftUI

struct UsersListView: View {
    @StateObject var viewModel: UsersViewModel
    @State private var showFilters = false
    
    var body: some View {
        NavigationView {
            VStack {
                searchBar
                
                if viewModel.isLoading && viewModel.users.isEmpty {
                    LoadingView()
                } else if viewModel.filteredUsers.isEmpty {
                    EmptyStateView()
                } else {
                    usersList
                }
            }
            .navigationTitle("Team")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Filters") { showFilters = true }
                }
            }
            .sheet(isPresented: $showFilters) {
                FiltersView(viewModel: viewModel)
            }
            .alert("Error", isPresented: .constant(viewModel.errorMessage != nil)) {
                Button("OK") { viewModel.clearError() }
                Button("Retry") { viewModel.loadUsers() }
            } message: {
                Text(viewModel.errorMessage ?? "")
            }
        }
    }
    
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Search team members...", text: $viewModel.searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
    
    private var usersList: some View {
        List(viewModel.filteredUsers) { user in
            UserRowView(user: user) { action in
                handleUserAction(action, for: user)
            }
        }
        .refreshable {
            viewModel.loadUsers()
        }
    }
    
    private func handleUserAction(_ action: UserAction, for user: User) {
        switch action {
        case .toggleStatus:
            viewModel.toggleUserStatus(user)
        case .delete:
            viewModel.deleteUser(user)
        }
    }
}

