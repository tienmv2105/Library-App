//
//  Book.swift
//  Library Management
//
//  Created by Van Tien on 5/7/26.
//
import SwiftUI

struct BookRoot: View {
    @Environment(AppRouter.self) var router
    @Environment(BookViewModel.self) var bookVM
    @Environment(UserViewModel.self) var userVM
    
    @State var searchText: String = ""
    
    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.book){
            VStack{
                List {
                    ForEach(bookVM.searchBook(searchTextfield: searchText)) { book in
                        HStack{
                            Text("\(book.name)")
                            Divider()
                            Text("\(book.author)")
                            Spacer()
                            Button{
                                router.push(.editBook(book))
                            }label: {
                                Text("Edit")
                                    .fontWeight(.bold)
                            }
                            .buttonStyle(.glassProminent)
                            Button{
                                bookVM.deleteBook(bookID: book.id)
                            } label: {
                                Image(systemName: "trash.fill")
                            }
                            .buttonStyle(.glassProminent)
                            .tint(.red)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            router.push(.detailBook(book))
                        }
                    }
                    Button{
                        router.push(.addBook)
                    } label: {
                        HStack{
                            Text("Add new book")
                            Image(systemName: "plus")
                        }
                    }
                    .buttonStyle(.glassProminent)
                }
            }
            .navigationTitle(Text("Book Screen"))
            .searchable(text: $searchText, placement: .navigationBarDrawer)
            .navigationDestination(for: DanhBa.self) { route in
                switch route {
                case.addBook:
                    AddBook(book: nil)
                        .environment(router)
                        .environment(bookVM)
                case .detailBook(let book):
                    DetailBook(book: book)
                        .environment(router)
                        .environment(bookVM)
                        .environment(userVM)
                case .editBook(let book):
                    AddBook(book: book)
                        .environment(router)
                        .environment(bookVM)
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    BookRoot()
        .environment(AppRouter())
        .environment(BookViewModel())
        .environment(UserViewModel())
}
