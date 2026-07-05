//
//  Book.swift
//  Library Management
//
//  Created by Van Tien on 5/7/26.
//
import SwiftUI

struct BookRoot: View {
    @Environment(AppRouter.self) var router
    
    
    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.book){
            VStack{
                Text("Book screen")
                List {
                     ForEach(0..<5) { book in
                         HStack{
                             Text("Book \(book)")
                             Spacer()
                             Button{} label: {
                                 Image(systemName: "trash.fill")
                             }
                             .buttonStyle(.glassProminent)
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
                .onTapGesture {
                    router.push(.detailBook)
                }
            }
            .navigationTitle(Text("Book Screen"))
            .navigationDestination(for: DanhBa.self) { route in
                switch route {
                case.addBook:
                    AddBook()
                        .environment(router)
                case .detailBook:
                    DetailBook()
                        .environment(router)
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
}
