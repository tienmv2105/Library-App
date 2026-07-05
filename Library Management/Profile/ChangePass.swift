//
//  ChangePass.swift
//  Library Management
//
//  Created by Van Tien on 3/7/26.
//
import SwiftUI
import Observation

struct ChangePass: View {
    @Environment(ViewModel.self) var viewModel
    @Environment(AppRouter.self) var router
    
    var body: some View {
        Text("Change Pass")
    }
}

#Preview {
    ChangePass()
        .environment(ViewModel())
        .environment(AppRouter())
}
