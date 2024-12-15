//
//  SubscriptionListView.swift
//  connected
//
//  Created by Artem Podorozhniy on 14.12.2024.
//

import SwiftUI

struct SubscriptionListView: View {
    
    @StateObject private var viewModel = SubscriptionViewModel()
    @State private var navigateToPayment = false

    var body: some View {
        
        ZStack{
            LinearGradient(colors: [.gray, .bg], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                HStack{
                    Image("logotipe")
                        .foregroundColor(.lightgray)
                    Image(systemName: "plus")
                        .bold()
                        .foregroundColor(.lightgray)
                }
                .padding(.bottom)
                

                    
                
                ScrollView {
                    
                    Text("Больше свободы и неограниченное количество запросов с подпиской")
                        .multilineTextAlignment(.center)
                        .bold()
                        .foregroundColor(.dark)
                        .padding(.horizontal)
                    ForEach(viewModel.plans) { plan in
                        SubscriptionPlanCardView(plan: plan, isSelected: plan == viewModel.selectedPlan)
                            .onTapGesture {
                                viewModel.selectedPlan = plan
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                    }
                    
                    VStack(alignment: .leading){
                        
                        Text("Преимущества подписки")
                            .foregroundColor(.white)
                            .font(.title2)
                            .padding()
                        VStack{
                            HStack{
                                Image(systemName: "leaf")
                                Text("Преимущество 1")
                                Spacer()
                            }
                            .padding()
                            .background()
                            .cornerRadius(12)
                            .padding(.horizontal)
                            
                            HStack{
                                Image(systemName: "leaf")
                                Text("Преимущество 2")
                                Spacer()
                            }
                            .padding()
                            .background()
                            .cornerRadius(12)
                            .padding(.horizontal)
                            
                            HStack{
                                Image(systemName: "leaf")
                                Text("Преимущество 3")
                                Spacer()
                            }
                            .padding()
                            .background()
                            .cornerRadius(12)
                            .padding(.horizontal)
                        }
                        .padding(.bottom)
                        
                    }
                    .background(Color.gray)
                    .cornerRadius(12)
                    .padding()
                    
                }

                
                Button(action: {
                    if viewModel.selectedPlan != nil {
                        navigateToPayment = true
                    }
                }) {
                    Text("Перейти к оплате")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(LinearGradient(colors: [.dark, .bg], startPoint: .topTrailing, endPoint: .bottomLeading))
                        .foregroundColor(.accent)
                        .cornerRadius(10)
                        .padding()
                }
                .disabled(viewModel.selectedPlan == nil)
                .fullScreenCover(isPresented: $navigateToPayment) {
                    if let selectedPlan = viewModel.selectedPlan {
                        PaymentView(plan: selectedPlan)
                    }
                }
            }
            .navigationTitle("Подписка")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SubscriptionListView()
}
