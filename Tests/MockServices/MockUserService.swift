//
//  MockUserService.swift
//  MvvmCombineDI
//
//  Created by hazemhabeb on 12/08/2025.
//
import Combine
import Foundation
@testable import MvvmCombineDI

class MockUserService: UserServiceProtocol {
    var usersToReturn: [User] = []
    var shouldReturnError = false
    
    func fetchUsers() -> AnyPublisher<[User], NetworkError> {
        if shouldReturnError {
            return Fail(error: NetworkError.serverError)
                .eraseToAnyPublisher()
        } else {
            return Just(usersToReturn)
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        }
    }
    
    func updateUser(_ user: User) -> AnyPublisher<User, NetworkError> {
        return Just(user)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
    
    func deleteUser(id: UUID) -> AnyPublisher<Void, NetworkError> {
        return Just(())
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
}
