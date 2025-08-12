//
//  UserServiceProtocol.swift
//  MvvmCombineDI
//
//  Created by hazemhabeb on 12/08/2025.
//

import Combine
import Foundation

protocol UserServiceProtocol {
    func fetchUsers() -> AnyPublisher<[User], NetworkError>
    func updateUser(_ user: User) -> AnyPublisher<User, NetworkError>
    func deleteUser(id: UUID) -> AnyPublisher<Void, NetworkError>
}
