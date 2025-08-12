//
//  UserRowView.swift
//  MvvmCombineDI
//
//  Created by hazemhabeb on 12/08/2025.
//
import SwiftUI

enum UserAction {
    case toggleStatus
    case delete
}

struct UserRowView: View {
    let user: User
    let onAction: (UserAction) -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            Text(user.avatar)
                .font(.system(size: 32))
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(user.name)
                        .font(.headline)
                    Spacer()
                    StatusBadge(isActive: user.isActive)
                }
                
                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(user.department)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(Color.blue.opacity(0.1))
                    .foregroundColor(.blue)
                    .cornerRadius(4)
            }
        }
        .padding(.vertical, 4)
        .swipeActions {
            Button("Delete", role: .destructive) {
                onAction(.delete)
            }
            
            Button(user.isActive ? "Deactivate" : "Activate") {
                onAction(.toggleStatus)
            }
            .tint(.blue)
        }
    }
}
