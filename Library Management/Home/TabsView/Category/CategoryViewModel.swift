//
//  CategoryViewModel.swift
//  Library Management
//
//  Created by Van Tien on 5/7/26.
//
import Foundation
import Observation

@Observable
class CategoryViewModel {
    
    var categories: [Category] = [
        Category(name: "Manga"),
        Category(name: "Horror"),
        Category(name: "Comic")
    ]
    
    func addCategory(categoryName: String) -> Category {
        let newCategory = Category(name: categoryName)
        categories.append(newCategory)
        return newCategory
    }
    
    func deleteCategory(id: String){
        if let index = categories.firstIndex(where: { $0.id == id }){
            categories.remove(at: index)
        }
    }
    
    func editCategory(id: String, newName: String){
        if let index = categories.firstIndex(where: { $0.id == id }) {
            categories[index].name = newName
        }
    }
    
    //Hàm "bắc cầu" để giao diện gọi và in ra tên thể loại
    func getCategory(id: String) -> Category? {
        return categories.first(where: { $0.id == id })
    }
}
