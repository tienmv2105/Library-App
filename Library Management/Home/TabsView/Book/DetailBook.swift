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
    @Environment(CategoryViewModel.self) var categorVM
    
    let book: Book
    
    init(book: Book){
        self.book = book
        
    }
    var body: some View {
        VStack{
            Text("Book name: \(book.name) ")
            
            Text("Author: \(book.author)")
            
            Text("Category: \(categorVM.getCategory(id: book.categoryID))")
            
            
            Text("Publish year: \(book.publishYear) ")
            
            Text("Quantity: \(book.quantity)")
            
            
            
                .navigationTitle(Text("Detail Book Screen"))
        }
    }
}

#Preview {
    DetailBook(book: Book(name: "Test name", categoryID: "Test", author: "Author test", publishYear: 0, quantity: 0))
        .environment(AppRouter())
        .environment(BookViewModel())
        .environment(CategoryViewModel())
}
