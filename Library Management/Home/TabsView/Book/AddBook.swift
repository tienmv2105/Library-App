//
//  AddBook.swift
//  Library Management
//
//  Created by Van Tien on 5/7/26.
//
import SwiftUI

struct AddBook: View {
    @Environment(AppRouter.self) var router
    @Environment(BookViewModel.self) var bookVM
    
    @State var bookName: String = ""
    @State var selectedCategoryID: String = ""
    @State var bookAuthor: String = ""
    @State var bookPublishYear: String = ""
    @State var bookQuantity: String = ""
    
    let book: Book?
    
    init(book: Book?){
        self.book = book
        _bookName = State(initialValue: book?.name ?? "")
        _bookAuthor = State(initialValue: book?.author ?? "")
        _bookPublishYear = State(initialValue: book != nil ? "\(book!.publishYear)" : "")
        _bookQuantity = State(initialValue: book != nil ? "\(book!.quantity)" : "")
        _selectedCategoryID = State(initialValue: book?.categoryID ?? "")
    }
    
    var body: some View {
        VStack{
            if book == nil {
                Text("Add category screen")
            } else {
                Text("Edit book screen: \(book?.name ?? "" )")
            }
            ScrollView{
                VStack(alignment: .leading){
                    Text("Book name")
                        .font(Font.system(size: 20, weight: .bold))
                    
                    TextField("", text: $bookName, prompt: Text("Insert book name"))
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background{
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        }
                        .padding(.bottom)
                    
                    Text("Book's author")
                        .font(Font.system(size: 20, weight: .bold))
                    
                    TextField("", text: $bookAuthor, prompt: Text("Insert author"))
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background{
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        }
                        .padding(.bottom)
                    
                    Text("Category ")
                        .font(Font.system(size: 20, weight: .bold))
                    
                    Menu{
                        Picker("Category", selection: $selectedCategoryID){
                            ForEach(bookVM.categories){ category in
                                Text(category.name).tag(category.id)
                                    .foregroundStyle(Color.black)
                            }
                        }
                    } label: {
                        HStack{
                            if let currentCategory = bookVM.categories.first(where: { $0.id == selectedCategoryID
                            }){
                                Text(currentCategory.name)
                                    .foregroundStyle(Color.black)
                            }
                            Spacer()
                            Image(systemName: "chevron.up.chevron.down")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background{
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        }
                    }
                    
                    Text("Publish year")
                        .font(Font.system(size: 20, weight: .bold))
                    
                    TextField("0", text: $bookPublishYear, prompt: Text("Insert publish year"))
                        .keyboardType(.numberPad)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background{
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        }
                        .padding(.bottom)
                    
                    Text("Book's quantity")
                        .font(Font.system(size: 20, weight: .bold))
                    
                    TextField("", text: $bookQuantity, prompt: Text("Insert quantity"))
                        .keyboardType(.numberPad)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background{
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        }
                        .padding(.bottom, 30)
                }
            }
            .onTapGesture {

            }
            .padding(.horizontal)
            
            Button{
                if book == nil{
                    let intPublishYear = Int(bookPublishYear) ?? 0
                    let intQuantity = Int(bookQuantity) ?? 0
                    bookVM.addBook(name: bookName, categoryID: selectedCategoryID, author: bookAuthor, publishYear: intPublishYear, quantity: intQuantity)
                    router.pop()
                } else {
                    if let id = book?.id {
                        let intPublishYear = Int(bookPublishYear) ?? 0
                        let intQuantity = Int(bookQuantity) ?? 0
                        bookVM.editBook(id: id, newName: bookName, NewcategoryID: selectedCategoryID, newAuthor: bookAuthor, newPublishYear: intPublishYear, newQuantity: intQuantity)
                        router.pop()
                    }
                }
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
    AddBook(book:  nil)
        .environment(BookViewModel())
        .environment(AppRouter())
}
