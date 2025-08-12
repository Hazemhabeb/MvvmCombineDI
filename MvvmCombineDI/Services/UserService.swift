//
//  UserService.swift
//  MvvmCombineDI
//
//  Created by hazemhabeb on 12/08/2025.
//

import Combine
import Foundation

class UserService: UserServiceProtocol {
    
    func fetchUsers() -> AnyPublisher<[User], NetworkError> {
        // Simulate API call with delay
        return Future<[User], NetworkError> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                // Simulate random success/failure (mostly success)
                if Int.random(in: 1...10) <= 8 {
                    promise(.success(User.samples))
                } else {
                    promise(.failure(.serverError))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func updateUser(_ user: User) -> AnyPublisher<User, NetworkError> {
        return Future<User, NetworkError> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
                promise(.success(user))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func deleteUser(id: UUID) -> AnyPublisher<Void, NetworkError> {
        return Future<Void, NetworkError> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.3) {
                promise(.success(()))
            }
        }
        .eraseToAnyPublisher()
    }
}
