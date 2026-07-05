//
//  ViewModel.swift
//  Library Management
//
//  Created by Van Tien on 3/7/26.
//
import Foundation
import Observation
import SwiftUI

@Observable
class ViewModel {
    var showSignUp: Bool = false
    var isLoggedIn: Bool = false
    var userLoggedIn: User?
    
    var users: [User] = [
        User(username: "Admin1", password: "123", fullName: "Tran Van A", role: "Admin"),
        User(username: "Librarian1", password: "123", fullName: "Nguyen Thi B", role: "Librarian"),
        User(username: "User1", password: "123", fullName: "Nguyen Quang C", role: "User")
    ]
    
    func checkLogin(username: String, password: String){
        if let findUser = users.first(where: { $0.username == username && $0.password == password }){
            isLoggedIn = true
            self.userLoggedIn = findUser
        } 
    }
    
    func forgotPassword(username: String, newPassword: String) -> String {
        if let index = users.firstIndex(where: { $0.username == username }){
            users[index].password = newPassword
            return "ok"
        } else {
            return "Username not found, please try again"
        }
    }
    
    func createUser(username: String, password: String, fullName: String, role: String){
        let newUser = User(username: username, password: password, fullName: fullName, role: role)
        users.append(newUser)
    }
    
    func checkUsername(username: String) -> Bool {
        let usernameExists = users.contains(where: { $0.username == username })
        return usernameExists
    }
}
