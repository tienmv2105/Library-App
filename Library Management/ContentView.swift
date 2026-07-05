//
//  ContentView.swift
//  Library Management
//
//  Created by Van Tien on 3/7/26.
//

import SwiftUI
import Observation

@MainActor
@Observable
class AppRouter {
     var dashBoard: [DanhBa] = []
     var category: [DanhBa] = []
     var book: [DanhBa] = []
     var user: [DanhBa] = []
    var login: [DanhBa] = []

    var selectedTab: DanhBaTab = .dashboard
    
    func push(_ route: DanhBa){
        switch selectedTab {
        case .dashboard:
            dashBoard.append(route)
        case .books:
            book.append(route)
        case .users:
            user.append(route)
        case .categories:
            category.append(route)
        }
    }
    
    func pop(){
        switch selectedTab {
        case .dashboard:
            dashBoard.removeLast()
        case .books:
            book.removeLast()
        case .categories:
            category.removeLast()
        case .users:
            user.removeLast()
        }
    }
    
    func popToRoot(){
        switch selectedTab {
        case .dashboard:
            dashBoard.removeAll()
        case .books:
            book.removeAll()
        case .categories:
            category.removeAll()
        case .users:
            user.removeAll()
        }
    }
    
}
// Route
enum DanhBa: Hashable{
    case signUp
    case forgotPassword
    case category
    case book
    case user
    case addCategory
    case addBook
    case detailBook
    case addUser
    case detailUser
}



struct ContentView: View {
    @Environment(AppRouter.self) var router
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        @Bindable var router = router
        if viewModel.isLoggedIn == true {
            HomeView()
                .environment(router)
        } else {
            NavigationStack(path: $router.login){
                LoginView()
                    .navigationTitle(Text("Login"))
                    .environment(router)
                    .navigationDestination(for: DanhBa.self){ route in
                        switch route {
                        case .signUp:
                            Signup()
                                .environment(router)
                        case .forgotPassword:
                            ForgotPass()
                                .environment(router)
                        default:
                            EmptyView()
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(ViewModel())
        .environment(AppRouter())
}
