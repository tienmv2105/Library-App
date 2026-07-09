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
        Category(name: "Fiction"),
        Category(name: "Non-Fiction"),
        Category(name: "Children")
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
    
}
