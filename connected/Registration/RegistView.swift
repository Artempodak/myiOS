//
//  RegistView.swift
//  connected
//
//  Created by Artem Podorozhniy on 10.12.2024.
//

import SwiftUI

struct RegistView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var loginViewModel : LoginViewModel
    
    @State var usermail = ""
    @State var userpassword = ""
    
    let fbManager = LoginViewModel()
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.bg, .dark], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(alignment: .leading){

                Spacer()
                
                Text("Регистрация")
                    .font(.largeTitle)
                    .padding(.bottom, 42)
                    .foregroundColor(.lightgray)
                
                Text("Ваша почта")
                    .font(.title3)
                    .foregroundColor(.lightgray)
                
                ZStack(alignment: .leading) {
                    
                    TextField("", text: $usermail)
                        .foregroundColor(.accent)
                        .fontWeight(.medium)
                        .padding()
                        .background(Color.lightgray.opacity(0.1))
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius:
                                                    10).stroke(Color.gray, lineWidth: 1))
                        .padding(.bottom,24)
                    
                    if usermail.isEmpty {
                        Text("e-mail")
                            .foregroundColor(.white)
                            .opacity(0.5)
                            .padding()
                            .padding(.bottom,24)
                    }
                    
                }
                
                HStack{
                    Text("Ваш пароль")
                        .font(.title3)
                        .foregroundColor(.lightgray)
                }
                
                ZStack (alignment: .leading) {
                    SecureField("", text: $userpassword)
                        .foregroundColor(.accent)
                        .fontWeight(.medium)
                        .padding()
                        .background(Color.lightgray.opacity(0.1))
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius:
                                                    10).stroke(Color.gray, lineWidth: 1))
                        .padding(.bottom,32)
                    
                    if userpassword.isEmpty {
                        Text("password")
                            .foregroundColor(.white)
                            .opacity(0.5)
                            .padding()
                            .padding(.bottom,36)
                    }
                }
                
                Button(action :{
                    fbManager.registNewUser(user :UserData(email: usermail, password: userpassword))
                    
                    loginViewModel.isLogin = true
                }){
                    Text("Зарегистрироваться")
                        .foregroundColor(.lightgray)
                        .fontWeight(.medium)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.bg)
                        .cornerRadius(12)
                }
                
                HStack{
                    Text("Есть аккаунт?")
                        .foregroundColor(.gray)
                    Button(action:{
                        dismiss()
                    }){
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

#Preview {
    RegistView()
}
