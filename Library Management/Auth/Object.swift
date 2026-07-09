//
//  Object.swift
//  Library Management
//
//  Created by Van Tien on 3/7/26.
//
import Foundation
import Observation

// 1. User - Quản lý người sử dụng hệ thống.
struct User: Identifiable, Equatable, Hashable {
    let id: String = UUID().uuidString
    var username: String
    var password: String
    var fullName: String
    var role: String
}

// 2. Category - Quản lý thể loại sách.
struct Category: Identifiable, Equatable, Hashable {
    let id: String = UUID().uuidString
    var name: String
}

// 3. Book - Quản lý sách
struct Book: Identifiable, Equatable, Hashable {
    let id: String = UUID().uuidString
    var name: String
    var categoryID: String 
    var author: String
    var publishYear: Int
    var quantity: Int
}

// 4. BorrowRecord - Quản lý việc mượn sách.
struct BookBorrowRecord: Identifiable, Equatable, Hashable {
    let id: String = UUID().uuidString
    var userID: String
    var bookID: String = UUID().uuidString
    var borrowDate: Date
    var returnDate: Date
    var isReturn: Bool
}
