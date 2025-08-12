//
//  StatusBadge.swift
//  MvvmCombineDI
//
//  Created by hazemhabeb on 12/08/2025.
//
import SwiftUI

struct StatusBadge: View {
    let isActive: Bool
    
    var body: some View {
        HStack(spacing: 4) {
            Circle()
                .fill(isActive ? Color.green : Color.gray)
                .frame(width: 6, height: 6)
            
            Text(isActive ? "Active" : "Inactive")
                .font(.caption)
                .fontWeight(.medium)
        }
    }
}
