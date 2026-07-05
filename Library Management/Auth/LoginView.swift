//
//  LoginView.swift
//  Library Management
//
//  Created by Van Tien on 3/7/26.
//
import SwiftUI
import Observation

struct LoginView: View {
    @Environment(AppRouter.self) var router
    @Environment(ViewModel.self) var viewModel
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                Text("Username")
                    .font(Font.system(size: 20, weight: .bold))
                
                TextField("", text: $username, prompt: Text("Insert your username"))
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                    }
                    .padding(.bottom, 20)
                
                Text("Password")
                    .font(Font.system(size: 20, weight: .bold))
                
                SecureField("", text: $password, prompt: Text("Insert your password"))
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
            .padding()
            
            Button{
//                router.loginPath.append(LoginRoute.forgotPassword)
                router.login.append(.forgotPassword)
            } label: {
                Text("Forgot password?")
                    .font(Font.system(size: 16, weight: .bold))
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 12)
            
            Button{
                viewModel.checkLogin(username: username, password: password)
            } label: {
                Text("Login")
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
            
            Button{
//                router.loginPath.append(LoginRoute.signUp)
                router.login.append(.signUp)
            } label: {
                Text("Sign up")
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
        }
        .navigationTitle("Login")
    }
}

#Preview {
    LoginView()
        .environment(AppRouter())
        .environment(ViewModel())
}
