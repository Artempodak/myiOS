


import SwiftUI

struct EnterMailView: View {
    
    @EnvironmentObject var loginViewModel : LoginViewModel
    
    @State var usermail = ""
    @State var userpassword = ""
    
    @State var isRegist = false
    
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.bg, .dark], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack(alignment: .leading){
                
                Image("logotipe")
                    .foregroundColor(.lightgray)
                    .frame(maxWidth: .infinity)
                    .padding(.top,42)
                Spacer()
                
                Text("Войти")
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
                    
                    Spacer()
                    Text("Забыли пароль?")
                        .foregroundColor(.white.opacity(0.7))
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
                
                Button(action: {
                    loginViewModel.login(email: usermail, password: userpassword)
                }) {
                    if loginViewModel.isLoading {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(colors: [.dark, .bg], startPoint: .topTrailing, endPoint: .bottomLeading))
                            .cornerRadius(12)
                    } else {
                        Text("Войти")
                            .foregroundColor(.lightgray)
                            .fontWeight(.medium)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient(colors: [.dark, .bg], startPoint: .topTrailing, endPoint: .bottomLeading))
                            .cornerRadius(12)
                    }
                }
                .disabled(loginViewModel.isLoading)
                
                if let errorMessage = loginViewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.bottom)
                }
                
                HStack{
                    Text("Нет аккаунта?")
                        .foregroundColor(.gray)
                    Button(action:{
                        isRegist.toggle()
                    }){
                        Text("Зарегистрируйтесь!")
                            .foregroundColor(.white)
                    }
                    .sheet(isPresented: $isRegist){
                        RegistView()
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
    EnterMailView()
}
