//
//  User.swift
//  Library Management
//
//  Created by Van Tien on 5/7/26.
//
import SwiftUI

struct UserRoot: View {
    @Environment(AppRouter.self) var router
    
    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.user){
            VStack{
                List {
                    ForEach(0..<5) { user in
                        HStack{
                            Text("User \(user)")
                            Spacer()
                            
                            Button{} label: {
                                Image(systemName: "trash.fill")
                            }
                            .buttonStyle(.glassProminent)
                        }
                    }
                    Button{
                        router.push(.addUser)
                    } label: {
                        HStack{
                            Text("Add User")
                            Spacer()
                            Image(systemName: "plus")
                        }
                    }
                    .buttonStyle(.glassProminent)
                    .padding(.horizontal)

                }
                .onTapGesture {
                    router.push(.detailUser)
                }
            }
            .navigationTitle(Text("User Root Screen"))
            .navigationDestination(for: DanhBa.self){ route in
                switch route {
                case .addUser:
                    AddUser()
                        .environment(router)
                case .detailUser:
                    DetailUser()
                        .environment(router)
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    UserRoot()
        .environment(AppRouter())
}
