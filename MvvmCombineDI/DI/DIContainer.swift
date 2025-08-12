//
//  DIContainer.swift
//  MvvmCombineDI
//
//  Created by hazemhabeb on 12/08/2025.
//
import Foundation

class DIContainer: ObservableObject {
    lazy var userService: UserServiceProtocol = UserService()
}
