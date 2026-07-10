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
    // Nhận cateVM từ môi trường
    @Environment(CategoryViewModel.self) var categoryVM
    
    @State var bookName: String = ""
    @State var bookAuthor: String = ""
    @State var bookPublishYear: String = ""
    @State var bookQuantity: String = ""
    
    // 1. Tạo 1 biến chứa ID của thể loại
    @State var selectedCategoryID: String = ""
    
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
                    
                    // 2.Tạo picker, mỗi selection == $selectedCategoryID
                    Menu{
                        Picker("Category", selection: $selectedCategoryID){
                            // Duyệt mảng Categories
                            ForEach(categoryVM.categories){ category in
                                // Hiển thị Category có trong categories, VÀ GẮN CÁI ID CỦA Category VÀO BIẾN selectedCategoryID
                                Text(category.name).tag(category.id)
                                    .foregroundStyle(Color.black)
                            }
                        }
                    } label: {
                        HStack{
                            // 3. Dùng hàm getCategory để lấy id của từng cate rồi gán vào biến tạm currentCategory
                            if let currentCategory = categoryVM.getCategory(id: selectedCategoryID){
                                Text(currentCategory.name)
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
                    // ép kiểu String sang Int
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
                if book == nil {
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
                } else {
                    Text("Save edit")
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
        .environment(CategoryViewModel())
}
