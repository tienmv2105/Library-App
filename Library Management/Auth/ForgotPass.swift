//
//  ForgotPass.swift
//  Library Management
//
//  Created by Van Tien on 3/7/26.
//
import SwiftUI
import Observation

struct ForgotPass: View {
    @Environment(ViewModel.self) var viewModel
    @Environment(AppRouter.self) var router
    @Environment(\.dismiss) var dismiss
    
    @State var username: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var errorMessage: String = ""
    @State var resetSuccess: Bool = false
    @State var confirmPasswordError: Bool = false
    @State var errorResetPassword: Bool = false
    
    
    
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
                
                Text("New Password")
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
                if confirmPassword == password {
                    let message = viewModel.forgotPassword(username: username, newPassword: password)
                    if message == "ok" {
                        resetSuccess = true
                        return
                    }
                    errorMessage = message
                    errorResetPassword = true
                } else {
                    confirmPasswordError = true
                }
            } label: {
                Text("Reset Password")
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
        .navigationTitle(Text("Forgot Pass"))
        .alert("Confirm Password doesn't match Password", isPresented: $confirmPasswordError) {
            Button("Ok", role: .cancel){}
        } message: {
            Text("Password and Confirm Password doesn't match, please try again")
        }
        .alert("Error", isPresented: $errorResetPassword){
            Button("Ok", role: .cancel){}
        } message: {
            Text(errorMessage)
        }
        .alert("Reset Password Success", isPresented: $resetSuccess){
            Button("Ok", role: .cancel){dismiss()}
        } message: {
            Text("Password has been reset successfully, please login with your new password")
        }
    }
}

#Preview {
    ForgotPass()
        .environment(ViewModel())
        .environment(AppRouter())
}
