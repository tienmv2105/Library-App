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
    @Environment(BookViewModel.self) var bookVM
    @Environment(CategoryViewModel.self) var categoryVM
    @Environment(UserViewModel.self) var userVM
    
    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.dashBoard){
            VStack{
                HStack{
                    Image(systemName: "book.closed.fill")
                    Text("Books available:")
                    Spacer()
                    let bookInStock = bookVM.books.reduce(0){ $0 + $1.quantity }
                    Text("\(bookInStock)")
                }
                .padding()
                
                Divider()
                
                HStack{
                    Image(systemName: "book.fill")
                    Text("Books borrowed:")
                    Spacer()
                    let bookIsBorrowed = userVM.records.filter({ $0.isReturn == false }).count
                    Text("\(bookIsBorrowed)")
                }
                .padding()
                
                Divider()
                
                HStack{
                    Image(systemName: "rectangle.stack.person.crop.fill")
                    Text("Categories:")
                    Spacer()
                    Text("\(categoryVM.categories.count)")
                }
                .padding()
                
                Divider()
                
                HStack{
                    Image(systemName: "person.fill")
                    Text("Borrowers:")
                    Spacer()
                    let recordsIsNotReturn = userVM.records.filter({ $0.isReturn == false })
                    let uniqueBorrowers = Set(recordsIsNotReturn.map({ $0.borrowerID }))
                    Text("\(uniqueBorrowers.count)")
                }
                .padding()
            }
            .padding(12)
            .background{
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
            }
            .overlay{
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.black, lineWidth: 2)
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
            
            VStack {
                ForEach(userVM.records.filter{ $0.isReturn == false }){ record in
                    let isOverdue = record.returnDate < Date()
                   
                    HStack{
                        Text("Borrower: \(userVM.getBorrower(borrowerID: record.borrowerID)?.name ?? "Not founded borrower")")
                        
                        Text("Sách: \(bookVM.getBook(id: record.bookID)?.name ?? "")")
                        Text(isOverdue ? "Overdue" : "On time" )
                            .foregroundStyle(isOverdue ? .red : .green)
                    }
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background{
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                    }
                    .overlay{
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.black, lineWidth: 2)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)
                }
            }
            
            .navigationTitle(Text("Dashboard"))
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
        .environment(BookViewModel())
        .environment(CategoryViewModel())
        .environment(UserViewModel())
    
}
