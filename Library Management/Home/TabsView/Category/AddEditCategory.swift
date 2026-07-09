//
//  AddCategory.swift
//  Library Management
//
//  Created by Van Tien on 5/7/26.
//
import SwiftUI

struct AddCategory: View {
    @Environment(AppRouter.self) var router
    @Environment(CategoryViewModel.self) var cateVM
    
    @State var categoryName: String = ""
    
    let category: Category?
    
    init(category: Category?) {
        self.category = category
        _categoryName = State(initialValue: category?.name ?? "")
        
    }
    
    var body: some View {
        VStack {
            if category == nil {
                Text("Add Category screen")
            } else {
                Text("Ban dang edit category: \(category?.name ?? "")")
            }
            
            VStack(alignment: .leading){
                Text("Category name")
                    .font(Font.system(size: 20, weight: .bold))
                
                TextField("", text: $categoryName, prompt: Text("Insert category name"))
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                    }
            }
            .padding(.horizontal)
            
            Button{
                // Luồng tạo category mới
                if category == nil {
                    _ = cateVM.addCategory(categoryName: categoryName)
                    
                } else {
                    if let id = category?.id {
                        cateVM.editCategory(id: id, newName: categoryName)
                    }
                }
                router.pop()
            } label: {
                Text("Add category")
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

                .navigationTitle(Text("Add Category screen"))
        }
    }
}

#Preview {
    AddCategory(category: nil)
        .environment(AppRouter())
        .environment(CategoryViewModel())
}
