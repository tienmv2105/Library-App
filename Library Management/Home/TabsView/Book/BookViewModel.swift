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
    
    static let manga = Category(name: "Manga")
    static let horror = Category(name: "Horror")
    
    var books: [Book] = [
        Book(name: "One Piece", categoryID: Category(name: "Manga").id, author: "Echiro Oda", publishYear: 1999, quantity: 5),
        Book(name: "Attack on Titan", categoryID: manga.id, author: "Hajime Isayama", publishYear: 2013, quantity: 3),
        Book(name: "Demon", categoryID: horror.id, author: "Ted", publishYear: 2004, quantity: 4)
        
    ]
    
    var categories: [Category] = [
        manga,
        horror
    ]
    
    //Hàm "bắc cầu" để giao diện gọi và in ra tên thể loại
    func getCategory(for book: Book) -> Category? {
        return categories.first { $0.id == book.categoryID }
    }
    
    
    func addBook(name: String, categoryID: String, author: String, publishYear: Int, quantity: Int){
        let newBook = Book(name: name, categoryID: categoryID, author: author
                           , publishYear: publishYear, quantity: quantity)
        books.append(newBook)
    }
    
    func editBook(id: String,newName: String, NewcategoryID: String, newAuthor: String, newPublishYear: Int, newQuantity: Int){
        if let index = books.firstIndex(where: { $0.id == id }){
            let updatedBook = Book(name: newName, categoryID: newAuthor, author: newAuthor, publishYear: newPublishYear, quantity: newQuantity)
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
            let matchName = book.name.lowercased().contains(lowercasedSearchTextfield)
            let matchAuthor = book.author.lowercased().contains(lowercasedSearchTextfield)
            // 5. Trả về tên hoặc tác giả
            return matchName || matchAuthor
        }
        return result
    }
}
