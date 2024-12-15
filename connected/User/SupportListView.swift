//
//  SupportListView.swift
//  connected
//
//  Created by Artem Podorozhniy on 14.12.2024.
//

import SwiftUI

struct SupportListView: View {
    var body: some View {
        
        ZStack{
            LinearGradient(colors: [.bg, .dark], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            Text("Hello, World!")
                .foregroundColor(.white)
        }
        .navigationTitle("Поддержка")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SupportListView()
}
