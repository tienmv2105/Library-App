//
//  DetailUser.swift
//  Library Management
//
//  Created by Van Tien on 5/7/26.
//
import SwiftUI

struct DetailUser: View {
    @Environment(AppRouter.self) var router
    @Environment(ViewModel.self) var viewModel
    @Environment(UserViewModel.self) var userVM
    
    let borrower: Borrower
    
    init(borrower: Borrower){
        self.borrower = borrower
    }
    var body: some View {
        VStack {
            VStack{
                VStack{
                    HStack{
                        Image(systemName: "person.fill")
                        Text("Name:")
                        Spacer()
                        Text(borrower.name)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    HStack{
                        Image(systemName: "phone.fill")
                        Text("Phone:")
                        Spacer()
                        Text(borrower.phone)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                }
                .padding(12)
                .background{
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                }
                .overlay{
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.black, lineWidth: 1)
                }
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)
                
                List {
                    Section {
                        ForEach(0..<5) { i in
                            VStack(alignment: .leading) {
                                HStack() {
                                    Text("\(i+1)")
                                    Divider()
                                    Text("Book name:")
                                }
                                Text("Borrow date:")
                                    .font(.caption)
                            }
                        }
                    }
                    header: {
                        Text("Borrower's records list")
                        
                        Button{} label: {
                            Text("Create new record")
                        }
                    }
                    footer: {
                        Button{
                            router.push(.createBorrowRecord)
                        } label: {
                            HStack {
                                Text("Create new record")
                                Image(systemName: "plus")
                            }
                            .fontWeight(.bold)
                        }
                        .buttonStyle(.glassProminent)
                        .padding(.vertical, 5)
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle(Text("Detail information"))
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        router.push(.createBorrowRecord)
                    } label: {
                        Text("Create records")
                    }
                }
            }
        }
    }
}

#Preview {
    DetailUser(borrower: Borrower(name: "test name", phone: "test phone"))
        .environment(AppRouter())
        .environment(UserViewModel())
        .environment(ViewModel())
}
