//
//  UsersViewModelTests.swift
//  MvvmCombineDI
//
//  Created by hazemhabeb on 12/08/2025.
//
import XCTest
import Combine
@testable import MvvmCombineDI

final class UsersViewModelTests: XCTestCase {
    var viewModel: UsersViewModel!
    var mockService: MockUserService!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        mockService = MockUserService()
        viewModel = UsersViewModel(userService: mockService)
        cancellables = Set<AnyCancellable>()
    }
    
    func testLoadUsersSuccess() {
        // Given
        let expectedUsers = [User.samples[0]]
        mockService.usersToReturn = expectedUsers
        
        let expectation = expectation(description: "Users loaded")
        
        // When
        viewModel.$users
            .dropFirst()
            .sink { users in
                XCTAssertEqual(users.count, expectedUsers.count)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // Then
        viewModel.loadUsers()
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testSearchFiltering() {
        // Given
        viewModel.users = User.samples
        
        let expectation = expectation(description: "Search applied")
        
        // When
        viewModel.$filteredUsers
            .dropFirst()
            .sink { users in
                XCTAssertEqual(users.count, 1)
                XCTAssertEqual(users.first?.name, "Hazem Habeb")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // Then
        viewModel.searchText = "Hazem"
        wait(for: [expectation], timeout: 1.0)
    }
}
