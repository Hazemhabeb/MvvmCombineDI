//
//  EmptyStateView.swift
//  MvvmCombineDI
//
//  Created by hazemhabeb on 12/08/2025.
//
import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "person.3")
                .font(.system(size: 64))
                .foregroundColor(.secondary)
            
            Text("No team members found")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Try adjusting your search or filters")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

