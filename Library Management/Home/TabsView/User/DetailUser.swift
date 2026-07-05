//
//  DetailUser.swift
//  Library Management
//
//  Created by Van Tien on 5/7/26.
//
import SwiftUI

struct DetailUser: View {
    @Environment(AppRouter.self) var router
    
    var body: some View {
        VStack {
            Text("Detail User")
                .navigationTitle(Text("Detail User Screen"))
        }
    }
}

#Preview {
    DetailUser()
        .environment(AppRouter())
}
