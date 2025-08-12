# MvvmCombineDI - Reactive MVVM with Combine & DI

A complete iOS app demonstrating **Reactive MVVM** with **Combine** and **Dependency Injection** patterns in **SwiftUI**.

---

## 📖 Article Series

This project accompanies the **"MVVM Like a Pro"** article series:

- **Part 1:** [Foundation MVVM in SwiftUI](https://medium.com/@hazemhabeb94/️-how-to-use-mvvm-like-a-pro-in-ios-part-1-2eb1ac60131d)
- **Part 2:** [MVVM + Coordinator Pattern](https://medium.com/@hazemhabeb94/mvvm-coordinator-the-secret-to-clean-navigation-in-swiftui-49b28307611f)
- **Part 3:** Reactive MVVM with Combine & DI ← _This project_
- **Part 4:** MVVM vs TCA Comparison

---

## ✨ Features

- 🔍 Real-time search with debounced input  
- 🏷️ Department filtering with dynamic options  
- ⚡ Reactive data flow using Combine publishers  
- 🧪 100% testable with dependency injection  
- 📱 Modern SwiftUI UI with professional design  
- 🔄 Pull-to-refresh functionality  
- ⚠️ Error handling with retry mechanisms  
- 📊 Loading states and empty views  

---

## 🏗️ Architecture

**Clean MVVM + Reactive Programming**

┌─────────────────┐ ┌──────────────────┐ ┌─────────────────┐
│ SwiftUI Views │◄───┤ ViewModels │◄───┤ Services │
│ │ │ (@Published) │ │ (Combine │
│ • UsersListView │ │ │ │ Publishers) │
│ • UserRowView │ │ • UsersViewModel │ │ │
│ • FiltersView │ │ • Reactive │ │ • UserService │
│ │ │ Bindings │ │ • Network Layer │
└─────────────────┘ └──────────────────┘ └─────────────────┘
▲ ▲ ▲
│ │ │
└────── Automatic UI ────┴─── Data Streams ──────┘
Updates (@Published) (Publishers)

---

## 📁 Project Structure

MvvmCombineDI/
├── 📱 App/
│ ├── MvvmCombineDIApp.swift
│ └── ContentView.swift
├── 📊 Models/
│ ├── User.swift
│ └── NetworkError.swift
├── 🌐 Services/
│ ├── UserServiceProtocol.swift
│ ├── UserService.swift
│ └── MockUserService.swift
├── 🧠 ViewModels/
│ └── UsersViewModel.swift
├── 📱 Views/
│ ├── UsersListView.swift
│ ├── UserRowView.swift
│ ├── FiltersView.swift
│ └── Components/
│ ├── StatusBadge.swift
│ ├── LoadingView.swift
│ └── EmptyStateView.swift
├── 💉 DI/
│ └── DIContainer.swift
├── 🛠️ Utils/
│ └── CancelBag.swift
└── 🧪 Tests/
├── UsersViewModelTests.swift
└── MockServices/
└── MockUserService.swift

---

## 🚀 Getting Started

### Prerequisites

- Xcode 15.0+
- iOS 15.0+
- Swift 5.9+

### Installation

```bash
git clone https://github.com/Hazemhabeb/MvvmCombineDI.git
cd MvvmCombineDI
open MvvmCombineDI.xcodeproj
Build and run:
⌘ + R
🧪 Running Tests
# In Xcode
⌘ + U

# Or via command line
xcodebuild test -scheme MvvmCombineDI -destination 'platform=iOS Simulator,name=iPhone 15 Pro'
📚 Key Concepts Demonstrated
🔄 Reactive Programming with Combine
Automatic UI Updates:
@Published var users: [User] = []
// SwiftUI automatically updates when this changes
Debounced Search:
$searchText
    .debounce(for: 0.3, scheduler: DispatchQueue.main)
    .sink { self.performSearch($0) }
Combining Data Streams:
Publishers.CombineLatest4($users, $searchText, $department, $showActiveOnly)
    .map(filterUsers)
    .assign(to: &$filteredUsers)
💉 Dependency Injection
Protocol-Based Services:
protocol UserServiceProtocol {
    func fetchUsers() -> AnyPublisher<[User], NetworkError>
}
Easy Testing with Mocks:
let viewModel = UsersViewModel(userService: MockUserService())
🧪 Testing Reactive Code
Testing Publishers:
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
@Published var newFilter: String = ""
Publishers.CombineLatest5($users, $searchText, $department, $showActiveOnly, $newFilter)
Adding New User Actions
enum UserAction {
    case toggleStatus
    case delete
    case edit
}
.swipeActions {
    Button("Edit") { onAction(.edit) }
}
🤝 Contributing
Fork the project
Create your feature branch:
git checkout -b feature/AmazingFeature
Commit your changes:
git commit -m 'Add some AmazingFeature'
Push to the branch:
git push origin feature/AmazingFeature
Open a Pull Request
📄 License
This project is licensed under the MIT License - see the LICENSE file for details.
📞 Contact
Hazem Habeb
LinkedIn
Project Link: https://github.com/Hazemhabeb/MvvmCombineDI
🙏 Acknowledgments
Apple's Combine Documentation
SwiftUI Tutorials
MVVM community and best practices
⭐ Found this helpful? Give it a star! ⭐

If you replace your current `README.md` with this formatted version, GitHub will render it cleanly with headings, code blocks, and proper spacing.  

Do you want me to also **add inline preview images** for the “Show Image” parts so they
