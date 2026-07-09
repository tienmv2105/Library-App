//
//  Category.swift
//  Library Management
//
//  Created by Van Tien on 5/7/26.
//
import SwiftUI

struct CategoryRoot: View {
    @Environment(AppRouter.self) var router
        
    @State var cateVM: CategoryViewModel = .init()
    
    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.category){
            Text("Category Root")
            
            List {
                ForEach(cateVM.categories){ category in
                    HStack  {
                        Text("\(category.name)")
                        Spacer()
                        Button{
                            router.push(.editCategory(category: category))
                        } label: {
                            Text("Edit")
                                .font(Font.body.weight(.bold))
                        }
                        .buttonStyle(.glassProminent)
                        Button{
                            cateVM.deleteCategory(id: category.id)
                        } label: {
                            Image(systemName: "trash.fill")
                        }
                        .buttonStyle(.glassProminent)
                    }
    
                }
                Button{
                    router.push(.addCategory)
                } label: {
                    Image(systemName: "plus")
                }
                .buttonStyle(.glassProminent)
            }
            .onTapGesture {
                
            }
            
                .navigationDestination(for: DanhBa.self){ route in
                    switch route {
                    case .addCategory:
                        AddCategory(category: nil)
                            .environment(router)
                            .environment(cateVM)
                    case .editCategory(let category):
                        AddCategory(category: category)
                            .environment(router)
                            .environment(cateVM)
                        
                    default:
                        EmptyView()
                    }
                }
        }
    }
}

#Preview {
    CategoryRoot()
        .environment(AppRouter())
}
