//
//  UserViewModel.swift
//  Library Management
//
//  Created by Van Tien on 15/7/26.
//
import Foundation
import Observation

@Observable
class UserViewModel {
    
    
    
    var borrowers: [Borrower] = []
    
    func addBorrower(name: String, phone: String){
        let newBorrower = Borrower(name: name, phone: phone)
        borrowers.append(newBorrower)
    }
    
    func deleteBorrower(id: String){
        if let index = borrowers.firstIndex(where: { $0.id == id }){
            borrowers.remove(at: index)
        }
    }
    
    func editBorrower(id: String, newName: String, newPhone: String){
        if let index = borrowers.firstIndex(where: { $0.id == id }){
            let editedBorrower = Borrower(name: newName, phone: newPhone)
            borrowers[index] = editedBorrower
        }
    }
    
    func searchBorrower(searchTextfield: String) -> [Borrower] {
        if searchTextfield.isEmpty {
            return borrowers
        }
        let lowercasedSearchTextfield = searchTextfield.lowercased()
        let result = borrowers.filter { borrower in
            let lowercasedName = borrower.name.lowercased()
            let matchName = lowercasedName.contains(lowercasedSearchTextfield)
            let matchPhone = borrower.phone.contains(lowercasedSearchTextfield)
            return matchName || matchPhone
        }
        return result
    }
    
    
}
