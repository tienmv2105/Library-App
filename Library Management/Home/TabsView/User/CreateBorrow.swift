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
    @Environment(BookViewModel.self) var bookVM
    @Environment(UserViewModel.self) var userVM
    
    @State var borrowDate: Date = Date()
    @State var returnDate: Date = Date()
    @State var selectedBookID: String = ""
    @State var isBookNotAvailable: Bool = false
    
    var stringDate: String = ""
    
    let borrower: Borrower
    
    init (borrower: Borrower) {
        self.borrower = borrower
    }
    
    var body: some View {
        VStack{
            Text("Create Borrow")
            Form {
                Text("Sach muon muon")
                
                Menu {
                    Picker("Book", selection: $selectedBookID){
                        ForEach(bookVM.books){ book in
                            Text(book.name).tag(book.id)
                                .foregroundStyle(.black)
                        }
                    }
                } label: {
                    HStack{
                        if let currentBook = bookVM.books.first(where: { $0.id == selectedBookID }) {
                            Text(currentBook.name)
                        } else {
                            Text("Select book")
                                .font(Font.body.bold())
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                    }
                }
                
                DatePicker("Chon ngay muon", selection: $borrowDate, displayedComponents: .date)
                    .datePickerStyle(.compact)
                
                let stringDate = borrowDate.formatted(date: .numeric, time: .omitted)
                
                Text(stringDate)
                            
                DatePicker("Chon ngay tra", selection: $returnDate, displayedComponents: .date)
                    .datePickerStyle(.compact)
                
                let stringReturnDate = returnDate.formatted(date: .abbreviated, time: .shortened)
                
                Text(stringReturnDate)
                
                Button{
                    let isHaveBook = bookVM.isHaveBook(bookID: selectedBookID)
                    if isHaveBook == true {
                        userVM.createRecord(borrowerID: borrower.id, bookID: selectedBookID, borrowDate: borrowDate, returnDate: returnDate)
                        router.pop()
                    }
                    if isHaveBook == false {
                        isBookNotAvailable = true
                    }
                } label: {
                    HStack{
                        Text("Create record")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(Color.blue)
                    .cornerRadius(8)
                }
                .disabled(selectedBookID.isEmpty)
            }
            
                .navigationTitle(Text("Book borrow record"))
                .alert("Book is not available", isPresented: $isBookNotAvailable){
                    Button("Ok", role: .cancel){}
                } message: {
                    Text("Book is not available")
                }
        }
    }
}

#Preview {
    CreateBorrow(borrower: Borrower(name: "test name", phone: "test phone"))
        .environment(AppRouter())
        .environment(ViewModel())
        .environment(BookViewModel())
        .environment(UserViewModel())
}
