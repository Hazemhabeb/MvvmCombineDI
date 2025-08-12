
MvvmCombineDI - Reactive MVVM with Combine & DI
Show Image
 Show Image
 Show Image
 Show Image
A complete iOS app demonstrating Reactive MVVM with Combine and Dependency Injection patterns in SwiftUI.
Show Image
📖 Article Series
This project accompanies the "MVVM Like a Pro" article series:
Part 1: Foundation MVVM in SwiftUI
Part 2: MVVM + Coordinator Pattern
Part 3: Reactive MVVM with Combine & DI ← This project
Part 4: MVVM vs TCA Comparison
✨ Features
🔍 Real-time search with debounced input
🏷️ Department filtering with dynamic options
⚡ Reactive data flow using Combine publishers
🧪 100% testable with dependency injection
📱 Modern SwiftUI UI with professional design
🔄 Pull-to-refresh functionality
⚠️ Error handling with retry mechanisms
📊 Loading states and empty views
🏗️ Architecture
Clean MVVM + Reactive Programming
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   SwiftUI Views │◄───┤   ViewModels     │◄───┤   Services      │
│                 │    │  (@Published)    │    │ (Combine        │
│ • UsersListView │    │                  │    │  Publishers)    │
│ • UserRowView   │    │ • UsersViewModel │    │                 │
│ • FiltersView   │    │ • Reactive       │    │ • UserService   │
│                 │    │   Bindings       │    │ • Network Layer │
└─────────────────┘    └──────────────────┘    └─────────────────┘
         ▲                        ▲                        ▲
         │                        │                        │
         └────── Automatic UI ────┴─── Data Streams ──────┘
                Updates (@Published)     (Publishers)
📁 Project Structure
MvvmCombineDI/
├── 📱 App/
│   ├── MvvmCombineDIApp.swift        # App entry point with DI
│   └── ContentView.swift           # Root view
├── 📊 Models/
│   ├── User.swift                  # User data model
│   └── NetworkError.swift          # Error types
├── 🌐 Services/
│   ├── UserServiceProtocol.swift   # Service abstraction
│   ├── UserService.swift           # Real implementation
│   └── MockUserService.swift       # Test implementation
├── 🧠 ViewModels/
│   └── UsersViewModel.swift        # Reactive ViewModel
├── 📱 Views/
│   ├── UsersListView.swift         # Main list view
│   ├── UserRowView.swift           # User row component
│   ├── FiltersView.swift           # Filters sheet
│   └── Components/
│       ├── StatusBadge.swift       # Status indicator
│       ├── LoadingView.swift       # Loading state
│       └── EmptyStateView.swift    # Empty state
├── 💉 DI/
│   └── DIContainer.swift           # Dependency injection
├── 🛠️ Utils/
│   └── CancelBag.swift            # Combine utilities
└── 🧪 Tests/
    ├── UsersViewModelTests.swift   # ViewModel tests
    └── MockServices/
        └── MockUserService.swift   # Test doubles
🚀 Getting Started
Prerequisites
Xcode 15.0+
iOS 15.0+
Swift 5.9+
Installation
Clone the repository:
bash
git clone https://github.com/Hazemhabeb/MvvmCombineDI.git
cd MvvmCombineDI
Open in Xcode:
bash
open MvvmCombineDI.xcodeproj
Build and run:
bash
⌘+R
🧪 Running Tests
bash
# Run all tests in Xcode
⌘+U

# Or via command line
xcodebuild test -scheme MvvmCombineDI -destination 'platform=iOS Simulator,name=iPhone 15 Pro'
📚 Key Concepts Demonstrated
🔄 Reactive Programming with Combine
Automatic UI Updates:
swift
@Published var users: [User] = []
// SwiftUI automatically updates when this changes
Debounced Search:
swift
$searchText
    .debounce(for: 0.3, scheduler: DispatchQueue.main)
    .sink { self.performSearch($0) }
Combining Data Streams:
swift
Publishers.CombineLatest4($users, $searchText, $department, $showActiveOnly)
    .map(filterUsers)
    .assign(to: &$filteredUsers)
💉 Dependency Injection
Protocol-Based Services:
swift
protocol UserServiceProtocol {
    func fetchUsers() -> AnyPublisher<[User], NetworkError>
}
Easy Testing with Mocks:
swift
let viewModel = UsersViewModel(userService: MockUserService())
🧪 Testing Reactive Code
Testing Publishers:
swift
viewModel.$users
    .dropFirst()
    .sink { users in
        XCTAssertEqual(users.count, expectedCount)
        expectation.fulfill()
    }
📊 Performance Features
Debounced search prevents excessive filtering
Lazy loading for large user lists
Memory management with CancelBag
Efficient SwiftUI updates with @Published
🎨 UI Features
Professional design with consistent spacing
Swipe actions for quick operations
Pull-to-refresh for manual updates
Loading states and empty views
Error alerts with retry options
🔧 Customization
Adding New Filters
Add property to UsersViewModel:
swift
@Published var newFilter: String = ""
Include in reactive pipeline:
swift
Publishers.CombineLatest5($users, $searchText, $department, $showActiveOnly, $newFilter)
Adding New User Actions
Extend UserAction enum:
swift
enum UserAction {
    case toggleStatus
    case delete
    case edit  // New action
}
Handle in UserRowView:
swift
.swipeActions {
    Button("Edit") { onAction(.edit) }
}
🤝 Contributing
Fork the project
Create your feature branch (git checkout -b feature/AmazingFeature)
Commit your changes (git commit -m 'Add some AmazingFeature')
Push to the branch (git push origin feature/AmazingFeature)
Open a Pull Request
📄 License
This project is licensed under the MIT License - see the LICENSE file for details.
📞 Contact
Hazem Habeb - https://www.linkedin.com/in/hazem-habeb-074880b7/
Project Link: https://github.com/Hazemhabeb/MvvmCombineDI.git
🙏 Acknowledgments
Apple's Combine Documentation
SwiftUI Tutorials
MVVM community and best practices
⭐ Found this helpful? Give it a star! ⭐
