//
//  BookViewModel.swift
//  Library Management
//
//  Created by Van Tien on 7/7/26.
//
import Observation
import Foundation

@Observable
class BookViewModel {
    
    var books: [Book] = [
        
    ]
    
    func addBook(name: String, categoryID: String, author: String, publishYear: Int, quantity: Int){
        let newBook = Book(name: name, categoryID: categoryID, author: author
                           , publishYear: publishYear, quantity: quantity)
        books.append(newBook)
    }
    
    func editBook(id: String,newName: String, NewcategoryID: String, newAuthor: String, newPublishYear: Int, newQuantity: Int){
        if let index = books.firstIndex(where: { $0.id == id }){
            let updatedBook = Book(name: newName, categoryID: NewcategoryID, author: newAuthor, publishYear: newPublishYear, quantity: newQuantity)
            books[index] = updatedBook
        }
    }
    
    func deleteBook(bookID: String){
        if let index = books.firstIndex(where: { $0.id == bookID }){
            books.remove(at: index)
        }
    }
    
    // 1.Đầu vào của hàm là textfiled của người dùng nhập/ yêu cầu trả về một,nhiều sách trong [book]
    func searchBook(searchTextfield: String) -> [Book]{
        // 2. Trường hợp nếu ô nhập rỗng thì trả về mảng rỗng, có thể đổi thành là đầy đủ danh sách ( em dò trên app của iphone thì ít ai làm kiểu này)
        if searchTextfield.isEmpty {
            return books
        }
        // 3. Xử lý trường hợp chữ viết hoa
        let lowercasedSearchTextfield = searchTextfield.lowercased()
        // 4. Khai báo kết quả là các book trong books có chứa tên(đã xử lý viết hoa,..) và tác giả( đã xử lý viết hoa,..)
        let result = books.filter { book in
            let bookNameLowercased = book.name.lowercased()
            let bookAuthorLowercased = book.author.lowercased()
            let matchName = bookNameLowercased.contains(lowercasedSearchTextfield)
            let matchAuthor = bookAuthorLowercased.contains(lowercasedSearchTextfield)
            // 5. Trả về tên hoặc tác giả
            return matchName || matchAuthor
        }
        return result
    }
    
    func getBook(id: String) -> Book? {
        return books.first(where: { $0.id == id })
    }
    
    func getCategoryFromBookID(bookID: String, categories: [Category]) -> Category? {
        if let book = books.first(where: { $0.id == bookID }) {
            return categories.first(where: { $0.id == book.categoryID })
        }
        return nil
    }
    
    //Hàm xem số lượng Sách trong books
    func isHaveBook(bookID: String) -> Bool {
        // Từ bookID tiềm ra index của Book trong books
        if let index = books.firstIndex(where: { $0.id == bookID }){
            // Nếu tìm ra thì check số lượng sách có lớn hơn 0
            if books[index].quantity > 0 {
                // Nếu lớn hơn 1 thì trừ số lượng quantity của Book đi 1 và trả về true
                books[index].quantity -= 1
                // trả về còn
                return true
            } else {
                // nếu không thì trả về false
                return false
            }
        }
        return false
    }
    
    // Hàm hoàn sách về kho khi return record
    func returnBook(bookID: String) {
        if let index = books.firstIndex(where: { $0.id == bookID }){
            books[index].quantity += 1
        }
    }
    
    // Hàm lấy tên sách
    func getBookName(bookID: String) -> Book? {
        return books.first(where: { $0.id == bookID })
    }
}
