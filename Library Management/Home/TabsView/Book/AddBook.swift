//
//  AddBook.swift
//  Library Management
//
//  Created by Van Tien on 5/7/26.
//
import SwiftUI

struct AddBook: View {
    @Environment(AppRouter.self) var router
    
    @State var BookName: String = ""
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("Book name")
                    .font(Font.system(size: 20, weight: .bold))
                
                TextField("", text: $BookName, prompt: Text("Insert book name"))
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
            .onTapGesture {

            }
            .padding(.horizontal)
            
            Button{
                router.pop()
            } label: {
                Text("Add book")
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
            .navigationTitle(Text("Add book screen"))
        }
        
    }
}

#Preview {
    AddBook()
        .environment(AppRouter())
}
