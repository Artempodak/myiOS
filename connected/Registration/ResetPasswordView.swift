//
//  ResetPasswordView.swift
//  connected
//
//  Created by Artem Podorozhniy on 16.12.2024.
//
import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    @State private var email = ""
    @State private var isMessageSent = false
    @State private var errorMessage: String?

    var body: some View {
        ZStack {
            LinearGradient(colors: [.bg, .dark], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 24) {
                Text("Восстановление пароля")
                    .font(.title)
                    .foregroundColor(.lightgray)

                Text("Введите вашу почту, и мы отправим ссылку для восстановления пароля.")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                TextField("e-mail", text: $email)
                    .foregroundColor(.accent)
                    .fontWeight(.medium)
                    .padding()
                    .background(Color.lightgray.opacity(0.1))
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))

                Button(action: {
                    resetPassword()
                }) {
                    Text("Отправить письмо")
                        .foregroundColor(.lightgray)
                        .fontWeight(.medium)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors: [.dark, .bg], startPoint: .topTrailing, endPoint: .bottomLeading))
                        .cornerRadius(12)
                }

                if isMessageSent {
                    Text("Письмо отправлено на \(email)")
                        .foregroundColor(.green)
                }

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }

                Spacer()
            }
            .padding()
        }
    }

    private func resetPassword() {
        guard !email.isEmpty else {
            errorMessage = "Введите email"
            return
        }

        loginViewModel.resetPassword(email: email) { success, error in
            if success {
                isMessageSent = true
                errorMessage = nil
            } else if let error = error {
                isMessageSent = false
                errorMessage = error.localizedDescription
            }
        }
    }
}

#Preview {
    ResetPasswordView()
}
