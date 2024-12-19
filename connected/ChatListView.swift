//
//  ChatListView.swift
//  connected
//
//  Created by Artem Podorozhniy on 14.12.2024.
//

import SwiftUI

struct ChatListView: View {
    @Binding var isTabBarHidden: Bool
    
    @State private var searchUser = ""
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.bg, .dark], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Image(systemName: "magnifyingglass")
                    TextField("Поиск", text: $searchUser)
                }
                .padding(8)
                .background(Color.white.opacity(0.2))
                .clipShape(Capsule())
                .padding()
                
                
                
                Spacer()
                
                
            }
            
        }
    }
}

