//
//  MvvmCombineDIApp.swift
//  MvvmCombineDI
//
//  Created by hazemhabeb on 12/08/2025.
//

import SwiftUI

@main
struct MvvmCombineDIApp: App {
    let container = DIContainer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(container)
        }
    }
}
