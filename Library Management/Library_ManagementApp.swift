//
//  Library_ManagementApp.swift
//  Library Management
//
//  Created by Van Tien on 3/7/26.
//

import SwiftUI

@main
struct Library_ManagementApp: App {
    @State var viewModel = ViewModel()
    @State var bookVM = BookViewModel()
    @State var categoryVM = CategoryViewModel()
    @State var router: AppRouter = .init()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
                .environment(bookVM)
            // Truyền cateVM 
                .environment(categoryVM)
                .environment(router)
        }
    }
}
