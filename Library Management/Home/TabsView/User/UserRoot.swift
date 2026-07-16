//
//  User.swift
//  Library Management
//
//  Created by Van Tien on 5/7/26.
//
import SwiftUI

struct UserRoot: View {
    @Environment(AppRouter.self) var router
    @Environment(ViewModel.self) var viewModel
    @Environment(UserViewModel.self) var userVM
    
    @State var searchText: String = ""
    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.user){
            VStack{
                List {
                    Section {
                        ForEach(userVM.searchBorrower(searchTextfield: searchText)) { borrower in
                            HStack{
                                Text("Borrower: \(borrower.name)")
                                Spacer()
                                
                                Button{
                                    userVM.deleteBorrower(id: borrower.id)
                                } label: {
                                    Image(systemName: "trash.fill")
                                }
                                .buttonStyle(.glassProminent)
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                router.push(.detailUser(borrower))
                            }
                        }
                    } footer: {
                        Button{
                            router.push(.addUser)
                        } label: {
                            HStack{
                                Text("Add User")
                                    .font(Font.body.bold())
                                Spacer()
                                Image(systemName: "plus")
                                    .font(Font.body.bold())
                            }
                        }
                        .frame(width: 130)
                        .frame(height: 60)
                        .buttonStyle(.glassProminent)
                        .padding(10)
                    }
                }
            }
            .navigationTitle(Text("User Root Screen"))
            .searchable(text: $searchText, placement: .navigationBarDrawer, prompt: Text("Search borrower"))
            .navigationDestination(for: DanhBa.self){ route in
                switch route {
                case .addUser:
                    AddUser(borrower: nil)
                        .environment(router)
                case .detailUser(let borrower):
                    DetailUser(borrower: borrower)
                        .environment(router)
                case .editUser(let borrower):
                    AddUser(borrower: borrower)
                        .environment(router)
                        .environment(userVM)
                case .createBorrowRecord:
                    CreateBorrow()
                        .environment(router)
                        .environment(userVM)
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    UserRoot()
        .environment(AppRouter())
        .environment(ViewModel())
        .environment(UserViewModel())
}
