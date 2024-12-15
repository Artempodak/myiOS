//
//  NotificationView.swift
//  connected
//
//  Created by Artem Podorozhniy on 13.12.2024.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [.bg, .dark], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                VStack{
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Text("qweqweqwe")
                                .font(.title)
                            Text("sd;kflskjfdlskjfslkfjslfdkvsldjf sldjf sdfkjndfkvldfkvldfvk dlfkvlkdfvldfkv dflkvldfvkdfvlk ldkfvldkfvldkfv dflvkdlfkvkdlfv  ")
                        }
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.accent)
                    }
                }
                .padding()
                .background(Color.lightgray.opacity(0.4))
                .cornerRadius(12)
                .padding(.horizontal)
                
                VStack{
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Text("qweqweqwe")
                                .font(.title)
                            Text("sd;kflskjfdlskjfslkfjslfdkvsldjf sldjf sdfkjndfkvldfkvldfvk dlfkvlkdfvldfkv dflkvldfvkdfvlk ldkfvldkfvldkfv dflvkdlfkvkdlfv  ")
                        }
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.accent)
                    }
                }
                .padding()
                .background(Color.lightgray.opacity(0.7))
                .cornerRadius(12)
                .padding(.horizontal)
                
                VStack{
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Text("qweqweqwe")
                                .font(.title)
                            Text("sd;kflskjfdlskjfslkfjslfdkvsldjf sldjf sdfkjndfkvldfkvldfvk dlfkvlkdfvldfkv dflkvldfvkdfvlk ldkfvldkfvldkfv dflvkdlfkvkdlfv  ")
                        }
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.accent)
                    }
                }
                .padding()
                .background(Color.lightgray.opacity(0.4))
                .cornerRadius(12)
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    NotificationView()
}
