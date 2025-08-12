//
//  ContentView.swift
//  MvvmCombineDI
//
//  Created by hazemhabeb on 12/08/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var container: DIContainer
    
    var body: some View {
        UsersListView(
            viewModel: UsersViewModel(
                userService: container.userService
            )
        )
    }
}
