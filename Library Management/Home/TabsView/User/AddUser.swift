//
//  AddUser.swift
//  Library Management
//
//  Created by Van Tien on 5/7/26.
//
import SwiftUI

struct AddUser: View {
    @Environment(AppRouter.self) var router
    @Environment(UserViewModel.self) var userVM
    @Environment(ViewModel.self) var viewModel
    
    @State var nameBorrower: String = ""
    @State var phoneBorrower: String = ""
    
    let borrower: Borrower?
    
    init(borrower: Borrower?){
        self.borrower = borrower
        _nameBorrower = State(initialValue: borrower?.name ?? "")
        _phoneBorrower = State(initialValue: borrower?.phone ?? "")
    }
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                Text("Borrower's name")
                    .font(Font.system(size: 20, weight: .bold))
                
                TextField("", text: $nameBorrower, prompt: Text("Insert borrower's name"))
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                    }
                    .padding(.bottom, 20)
                
                Text("Borrower's phone number")
                    .font(Font.system(size: 20, weight: .bold))
                
                TextField("", text: $phoneBorrower, prompt: Text("Insert borrower's phone number"))
                    .textInputAutocapitalization(.never)
                    .keyboardType(.numberPad)
                    .autocorrectionDisabled()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                    }
            }
            .padding()
            
            Button{
                if let borrower {
                    userVM.editBorrower(id: borrower.id, newName: nameBorrower, newPhone: phoneBorrower)
                } else {
                    userVM.addBorrower(name: nameBorrower, phone: phoneBorrower)
                }
                router.pop()
            } label: {
                if borrower == nil {
                    Text("Add borrower")
                } else {
                    Text("Edit borrower")
                }
                
                
            }
            .foregroundStyle(Color.white)
            .font(.title3)
            .fontWeight(.bold)
            .contentShape(Rectangle())
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background{
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.blue)
            }
            .padding(.horizontal)
            .padding(.top, 50)
            
            .navigationTitle(Text("Add User Screen"))
        }
    }
}

#Preview {
    AddUser(borrower: nil)
        .environment(AppRouter())
        .environment(ViewModel())
        .environment(UserViewModel())
}
