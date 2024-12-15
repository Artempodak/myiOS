//
//  SubscriptionPlanCardView.swift
//  connected
//
//  Created by Artem Podorozhniy on 14.12.2024.
//

import SwiftUI


struct SubscriptionPlanCardView: View {
    let plan: SubscriptionPlan
    let isSelected: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(plan.title)
                    .font(.headline)
                    .foregroundColor(isSelected ? .white : .primary)
                if isSelected {
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom))
                }
            }

//            Text(plan.description)
//                .font(.subheadline)
//                .foregroundColor(isSelected ? .white : .secondary)

            Text(plan.price)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(isSelected ? .white : .primary)
        }
        .padding()
        .background(isSelected ? .gray : .green)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isSelected ? .gray : .red, lineWidth: 2)
        )
        .animation(.easeInOut, value: isSelected)
    }
}
