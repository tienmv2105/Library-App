//
//  AddUser.swift
//  Library Management
//
//  Created by Van Tien on 5/7/26.
//
import SwiftUI

struct AddUser: View {
    @Environment(AppRouter.self) var router
    
    @State var nameUser: String = ""
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                Text("User name")
                    .font(Font.system(size: 20, weight: .bold))
                
                TextField("", text: $nameUser, prompt: Text("Insert user name"))
                    .textInputAutocapitalization(.never)
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
                router.pop()
            } label: {
                Text("Add User")
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
            }
            .padding(.horizontal)
            
            .navigationTitle(Text("Add User Screen"))
        }
    }
}

#Preview {
    AddUser()
        .environment(AppRouter())
}
