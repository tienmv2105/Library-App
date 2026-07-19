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
    
    var records: [BookBorrowRecord] = []
    
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
    
    func getRecordStatus(record: BookBorrowRecord) -> (status: String, days: Int){
        let celendar = Calendar.current
        let startDate = record.borrowDate
        if record.isReturn {
            let days = celendar.dateComponents([.day], from: record.borrowDate, to: record.returnDate).day ?? 0
            return ("Return", days)
        } else {
            let days = celendar.dateComponents([.day], from: record.borrowDate, to: startDate).day ?? 0
            return ("Not Return", days)
        }
    }
    
    // Hàm tạo records
    func createRecord(borrowerID: String, bookID: String, borrowDate: Date, returnDate: Date){
        let newRecord = BookBorrowRecord(borrowerID: borrowerID, bookID: bookID, borrowDate: borrowDate, returnDate: returnDate, isReturn: false)
        records.append(newRecord)
    }
    
    // Hàm trả sách chuyển trạng thái isReturn
    func returnBook(recordID: String){
        if let index = records.firstIndex(where: { $0.id == recordID }) {
            records[index].isReturn = true
        }
    }
    
    // Hàm tính ngày mượn sách
    func calculateBorrowDays(borrowDate: Date, returnDate: Date) -> Int {
        // Bước mặc định khi làm việc với kiểu :Date
        let calendar = Calendar.current
        //  Yêu cầu tính toán khoảng cách riêng cho Components "ngày" (.day)
        let daysRemain = calendar.dateComponents([.day], from: borrowDate, to: returnDate)
        
        return daysRemain.day ?? 0
    }
    
    // Hàm hiển thị record cho mỗi borrower
    func filterRecords(borrowerID: String) -> [BookBorrowRecord] {
        let danhSachRecord = records.filter { $0.borrowerID == borrowerID }
        return danhSachRecord
    }
    
    // Hàm tìm Borrower từ borrowerID
    func getBorrower(borrowerID: String) -> Borrower? {
        if let borrower = borrowers.first(where: { $0.id == borrowerID }){
            return borrower
        }
        return nil
    }
}
