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
    @State var router: AppRouter = .init()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
                .environment(router)
        }
    }
}
