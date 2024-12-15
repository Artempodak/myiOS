//
//  RegistView.swift
//  connected
//
//  Created by Artem Podorozhniy on 10.12.2024.
//

import SwiftUI

struct RegistView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    @State private var usermail = ""
    @State private var userpassword = ""
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.bg, .dark], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Spacer()
                
                Text("Регистрация")
                    .font(.largeTitle)
                    .padding(.bottom, 42)
                    .foregroundColor(.lightgray)
                
                InputField(title: "Ваша почта", placeholder: "e-mail", text: $usermail)
                InputField(title: "Ваш пароль", placeholder: "password", text: $userpassword, isSecure: true)
                
                if let errorMessage = loginViewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.bottom)
                }
                
                Button(action: {
                    loginViewModel.registerNewUser(user: UserData(email: usermail, password: userpassword))
                }) {
                    if loginViewModel.isLoading {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.bg)
                            .cornerRadius(12)
                    } else {
                        Text("Зарегистрироваться")
                            .foregroundColor(.lightgray)
                            .fontWeight(.medium)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.bg)
                            .cornerRadius(12)
                    }
                }
                .disabled(loginViewModel.isLoading)
                
                HStack {
                    Text("Есть аккаунт?")
                        .foregroundColor(.gray)
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Войти")
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 32)
                .frame(maxWidth: .infinity)
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct InputField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title3)
                .foregroundColor(.lightgray)
            
            if isSecure {
                SecureField(placeholder, text: $text)
                    .inputFieldStyle()
            } else {
                TextField(placeholder, text: $text)
                    .inputFieldStyle()
            }
        }
    }
}

extension View {
    func inputFieldStyle() -> some View {
        self
            .foregroundColor(.accent)
            .fontWeight(.medium)
            .padding()
            .background(Color.lightgray.opacity(0.1))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.bottom, 24)
    }
}
#Preview {
    RegistView()
}
