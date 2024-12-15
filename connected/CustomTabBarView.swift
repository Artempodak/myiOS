//
//  CustomTabBarView.swift
//  connected
//
//  Created by Artem Podorozhniy on 13.12.2024.
//

import SwiftUI
import SwiftUI

struct CustomTabBarView: View {
    
    @State private var selectedTab: Tab = .profile
    
    var body: some View {
        ZStack{
            Color.bg
                .ignoresSafeArea()
            VStack (spacing: 0){
                // Основное содержимое вкладок
                switch selectedTab {
                case .listai:
                    ChatListView()
                case .chatai:
                    ChatView()
                case .profile:
                    ProfileView()
                }
                
                Spacer()
                
                // Кастомный таббар
                
                HStack {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        Spacer()
                        TabBarItem(tab: tab, selectedTab: $selectedTab)
                        Spacer()
                    }
                }
                .background(Color.bg)
            }
        }
    }
}

enum Tab: String, CaseIterable {
    case listai = "text.redaction"
    case chatai = "bubble.left.and.bubble.right.fill"
    case profile = "person.fill"
}

struct TabBarItem: View {
    let tab: Tab
    @Binding var selectedTab: Tab
    
    var isSelected: Bool {
        selectedTab == tab
    }
    
    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            VStack {
                ZStack {
                    if isSelected {
                        Circle()
                            .fill(Color.dark.opacity(0.2))
                            .frame(width: 50, height: 50)
                    }
                    
                    Image(systemName: tab.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: isSelected ? 30 : 24, height: isSelected ? 30 : 24)
                        .foregroundColor(isSelected ? .accent : .darkaccent)
                        .animation(.spring(), value: isSelected)
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        CustomTabBarView()
    }
}


#Preview {
    CustomTabBarView()
}
