//
//  Category.swift
//  Library Management
//
//  Created by Van Tien on 5/7/26.
//
import SwiftUI

struct CategoryRoot: View {
    @Environment(AppRouter.self) var router
        
    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.category){
            Text("Category Root")
            
            List {
                ForEach(0..<5){ category in
                    HStack  {
                        Text("Category \(category)")
                        Spacer()
                        Button{} label: {
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
            
                .navigationDestination(for: DanhBa.self){ route in
                    switch route {
                    case .addCategory:
                        AddCategory()
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
