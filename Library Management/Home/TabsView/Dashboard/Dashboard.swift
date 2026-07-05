//
//  Dashboard.swift
//  Library Management
//
//  Created by Van Tien on 4/7/26.
//
import SwiftUI
import Observation


struct DashboardView: View {
    @Environment(AppRouter.self) var router
    
    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.dashBoard){
            Text("Dashboard Root")
                .navigationDestination(for: DanhBa.self){ route in
//                    switch route {
//                    
//                    }
                }
        }
    }
}

#Preview {
    DashboardView()
        .environment(AppRouter())
}
