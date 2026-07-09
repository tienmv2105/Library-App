//
//  DetailBook.swift
//  Library Management
//
//  Created by Van Tien on 5/7/26.
//
import SwiftUI

struct DetailBook: View {
    @Environment(AppRouter.self) var router
    @Environment(BookViewModel.self) var bookVM
    
    let book: Book
    
    init(book: Book){
        self.book = book
        
    }
    var body: some View {
        VStack{
            Text("Book name: \(book.name) ")
            
            Text("Author: \(book.author)")
            
            Text("Category: ")
            
            Text("Publish year: \(book.publishYear) ")
            
            Text("Quantity: \(book.quantity)")
            
            
                .navigationTitle(Text("Detail Book Screen"))
        }
    }
}

#Preview {
    DetailBook(book: .init(name: "Book name test", categoryID: " Author test", author: "Category test", publishYear: 2020, quantity: 10))
        .environment(AppRouter())
        .environment(BookViewModel())
}
