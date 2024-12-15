//
//  ProfileView.swift
//  connected
//
//  Created by Artem Podorozhniy on 13.12.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var loginViewModel : LoginViewModel
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(colors: [.gray, .bg], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Circle()
                            .frame(width: 40)
                        VStack(alignment: .leading){
                            Text("UserName")
                                .foregroundColor(.lightgray)
                            Text("UserMail")
                                .font(.callout)
                                .foregroundColor(.lightgray)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.accent)
                    }
                    .padding()
                    .background(Color.bg.opacity(0.4))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    NavigationLink(destination: NotificationView()){
                        HStack{
                            Text("Уведомления")
                                .foregroundColor(.lightgray)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.accent)
                        }
                        .padding()
                        .background(Color.bg.opacity(0.4))
                        .cornerRadius(12)
                        .padding(.horizontal)
                    }
                    VStack(alignment: .leading){
                        HStack(alignment: .top){
                            Image("logoapp")
                                .resizable()
                                .frame(width: 40, height: 40)
                            VStack(alignment: .leading){
                                Text("Connectred +")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .bold()
                                Text("Выберите тариф и получите неограниченный доступ ко всем функциям приложения")
                                    .foregroundColor(.lightgray)
                                    
                            }
                        }
                        .padding(.horizontal)
                            NavigationLink(destination: SubscriptionListView()){
                                Text("Выбрать тариф")
                                    .fontWeight(.medium)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.dark)
                                    .cornerRadius(12)
                                    .padding()
                            }
                        
                    }
                    .padding(.top)
                    .background(Color.dark.opacity(0.4))
                    .cornerRadius(12)
                    .padding()
                    
                    NavigationLink(destination: SupportListView()){
                        HStack{
                            Text("Помощь")
                                .foregroundColor(.lightgray)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.accent)
                        }
                        .padding()
                        .background(Color.bg.opacity(0.4))
                        .cornerRadius(12)
                        .padding(.horizontal)
                    }
                    
                    HStack{
                        Text("Язык")
                            .foregroundColor(.lightgray)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.accent)
                    }
                    .padding()
                    .background(Color.bg.opacity(0.4))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    HStack{
                        Text("Версия приложения")
                            .foregroundColor(.lightgray)
                        Spacer()
                        Text("1.01")
                            .foregroundColor(.gray)

                    }
                    .padding()
                    .background(Color.bg.opacity(0.4))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    
                    Spacer()
                    Button(action :{
                        loginViewModel.isLogin = false
                    }){
                        Text("Выйти")
                            .foregroundColor(.lightgray)
                            .fontWeight(.medium)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient(colors: [.dark, .bg], startPoint: .topTrailing, endPoint: .bottomLeading))
                            .cornerRadius(12)
                            .padding()
                    }
                }
            }
            .navigationTitle("Профиль")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView()
}
