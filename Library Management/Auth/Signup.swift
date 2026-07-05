//
//  Signup.swift
//  Library Management
//
//  Created by Van Tien on 3/7/26.
//
import SwiftUI
import Observation

struct Signup: View {
    @Environment(ViewModel.self) var viewModel
    @Environment(AppRouter.self) var router
    @Environment(\.dismiss) var dismiss
    
    @State var username: String = ""
    @State var password: String = ""
    @State var fullName: String = ""
    @State var role: String = ""
    @State var confirmPassword: String = ""
    @State var confirmPasswordError: Bool = false
    @State var isUsernameExist: Bool = false
    @State var signUpSuccess: Bool = false
    
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
                    .frame(height: 50)
                    .background{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                    }
                    .padding(.bottom, 20)
                
                Text("Full Name")
                    .font(Font.system(size: 20, weight: .bold))
                
                TextField("", text: $fullName, prompt: Text("Insert your full name"))
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                    }
                    .padding(.bottom, 20)
                
                Text("Role")
                    .font(Font.system(size: 20, weight: .bold))
                
                TextField("", text: $role, prompt: Text("Insert your role"))
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                    }
                    .padding(.bottom, 20)
                
                Text("Password")
                    .font(Font.system(size: 20, weight: .bold))
                
                SecureField("", text: $password, prompt: Text("Insert your password"))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                    }
                    .padding(.bottom, 20)
                
                Text("Confirm Password")
                    .font(Font.system(size: 20, weight: .bold))
                
                SecureField("", text: $confirmPassword, prompt: Text("Insert your confirm password"))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                    }
            }
            .padding()
            
            Button{
                if viewModel.checkUsername(username: username){
                    isUsernameExist = true
                }
                if password != confirmPassword{
                    confirmPasswordError = true
                }
                
                if confirmPassword == password && isUsernameExist == false {
                    viewModel.createUser(username: username, password: password, fullName: fullName, role: role)
                }
                signUpSuccess = true
            } label: {
                Text("Sign up")
                    .font(.title3)
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                    .contentShape(Rectangle())
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background{
                        RoundedRectangle(cornerRadius: 6)
                    }
            }
            .padding()
        }
        .navigationTitle(Text("Sign up"))
        .alert("Username is exist", isPresented: $isUsernameExist){
            Button("ok", role: .cancel){}
        } message: {
            Text("Username is already exist, please choose another username")
        }
        .alert("Confirm password error", isPresented: $confirmPasswordError){
            Button("ok", role: .cancel){}
        } message: {
            Text("Your password and confirm password doesn't match")
        }
        .alert("Sign up success", isPresented: $signUpSuccess){
            Button("ok", role: .cancel){dismiss()}
        } message: {
            Text("Your account has been created successfully")
        }
    }
}
#Preview {
    Signup()
        .environment(ViewModel())
        .environment(AppRouter())
}
