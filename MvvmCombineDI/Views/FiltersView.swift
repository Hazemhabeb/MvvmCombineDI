//
//  FiltersView.swift
//  MvvmCombineDI
//
//  Created by hazemhabeb on 12/08/2025.
//
import SwiftUI

struct FiltersView: View {
    @ObservedObject var viewModel: UsersViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section("Department") {
                    Picker("Select Department", selection: $viewModel.selectedDepartment) {
                        Text("All Departments").tag(String?.none)
                        ForEach(viewModel.departments, id: \.self) { department in
                            Text(department).tag(String?.some(department))
                        }
                    }
                }
                
                Section("Status") {
                    Toggle("Show active users only", isOn: $viewModel.showActiveOnly)
                }
            }
            .navigationTitle("Filters")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}
