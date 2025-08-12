//
//  User.swift
//  MvvmCombineDI
//
//  Created by hazemhabeb on 12/08/2025.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    let id = UUID()
    let name: String
    let email: String
    let department: String
    let avatar: String
    var isActive: Bool
    
    static let samples = [
        User(name: "Hazem Habeb", email: "hazem@example.com", department: "Engineering", avatar: "👨‍💻", isActive: true),
        User(name: "Sarah Johnson", email: "sarah@example.com", department: "Design", avatar: "👩‍🎨", isActive: true),
        User(name: "Mike Chen", email: "mike@example.com", department: "Product", avatar: "👨‍💼", isActive: false),
        User(name: "Anna Smith", email: "anna@example.com", department: "Engineering", avatar: "👩‍💻", isActive: true)
    ]
}
