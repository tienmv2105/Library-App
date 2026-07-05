//
//  DetailBook.swift
//  Library Management
//
//  Created by Van Tien on 5/7/26.
//
import SwiftUI

struct DetailBook: View {
    @Environment(AppRouter.self) var router
    
    var body: some View {
        VStack{
            Text("Book name: ")
            
            Text("Author: ")
            
            Text("Category:")
            
            
                .navigationTitle(Text("Detail Book Screen"))
        }
    }
}

#Preview {
    DetailBook()
        .environment(AppRouter())
}
