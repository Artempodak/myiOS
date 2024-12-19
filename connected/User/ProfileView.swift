//
//  ProfileView.swift
//  connected
//
//  Created by Artem Podorozhniy on 13.12.2024.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @Binding var isTabBarHidden: Bool
    
    @EnvironmentObject var loginViewModel : LoginViewModel
    
    // Получение текущего пользователя
    var userEmail: String {
        Auth.auth().currentUser?.email ?? "Неизвестно"
    }
    
    @State private var isShowProfileSettings = false
    
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(colors: [.gray, .bg], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack{
                    Button(action:{
                        isShowProfileSettings.toggle()
                    }){
                        HStack{
                            Circle()
                                .frame(width: 40)
                            VStack(alignment: .leading){
                                Text("UserName")
                                    .foregroundColor(.lightgray)
                                Text(userEmail)
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
                    }
                    .sheet(isPresented: $isShowProfileSettings){
                        ProgileSettingsView()
                    }
                    
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
