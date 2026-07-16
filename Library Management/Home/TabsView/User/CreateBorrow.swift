//
//  CreateBorrow.swift
//  Library Management
//
//  Created by Van Tien on 16/7/26.
//
import SwiftUI
import Observation


struct CreateBorrow: View {
    
    @Environment(AppRouter.self) var router
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        VStack{
            Text("Create Borrow")
                .navigationTitle(Text("Book borrow record"))
        }
    }
}

#Preview {
    CreateBorrow()
        .environment(AppRouter())
        .environment(ViewModel())
}
