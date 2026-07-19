//
//  DetailRecord.swift
//  Library Management
//
//  Created by Van Tien on 17/7/26.
//
import SwiftUI

struct DetailRecord: View {
    @Environment(AppRouter.self) var router
    @Environment(UserViewModel.self) var userVM
    @Environment(BookViewModel.self) var bookVM
    
    @State var isReturnSuccess: Bool = false
    
    let bookBorrowRecord: BookBorrowRecord
    
    
    init (bookBorrowRecord: BookBorrowRecord) {
        self.bookBorrowRecord = bookBorrowRecord
    }
    var body: some View {
        VStack{
            Text("Detail Record")
            
            Text("Return status: \(userVM.records.first(where: { $0.id == bookBorrowRecord.id })?.isReturn == true ? "Return" : "Not Return")")
            
            if bookBorrowRecord.isReturn == false {
                Button{
                    // trả về sách đã mượn
                    bookVM.returnBook(bookID: bookBorrowRecord.bookID)
                    userVM.returnBook(recordID: bookBorrowRecord.id)
                    
                    isReturnSuccess = true
                } label: {
                    HStack{
                        Text("Return")
                    }
                }
            }
        }
        .navigationTitle(Text("Detail Record"))
        .alert("Return Success", isPresented: $isReturnSuccess){
            Button("Ok", role: .cancel){}
        } message: {
            Text("Return Success")
        }
    }
}

#Preview {
    DetailRecord(bookBorrowRecord: BookBorrowRecord(borrowerID: "test", bookID: "test", borrowDate: Date(), returnDate: Date(), isReturn: false))
        .environment(AppRouter())
        .environment(UserViewModel())
        .environment(BookViewModel())
}
