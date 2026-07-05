//
//  HomeView.swift
//  Library Management
//
//  Created by Van Tien on 3/7/26.
//
import SwiftUI
import Observation

enum DanhBaTab: Hashable {
    case dashboard
    case books
    case categories
    case users
}

struct HomeView: View {
    @Environment(ViewModel.self) var viewModel
    @Environment(AppRouter.self) var router
    
    
    var body: some View {
        @Bindable var router = router
        VStack {
            TabView(selection: $router.selectedTab) {
                DashboardView()
                    .tabItem{ Label("Dashboard", systemImage: "list.clipboard.fill") }
                    .tag(DanhBaTab.dashboard)
                    
                CategoryRoot()
                    .tabItem { Label("Categories", systemImage: "list.bullet") }
                    .tag(DanhBaTab.categories)
                
                UserRoot()
                    .tabItem { Label("Users", systemImage: "person.crop.circle") }
                    .tag(DanhBaTab.users)
                
                BookRoot()
                    .tabItem { Label("Books", systemImage: "book.closed") }
                    .tag(DanhBaTab.books)
                
            }
            .environment(router)
        }
        .navigationTitle("Home")
    }
}

#Preview {
    HomeView()
        .environment(AppRouter())
        .environment(ViewModel())
}
