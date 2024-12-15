//
//  SubscriptionViewModel.swift
//  connected
//
//  Created by Artem Podorozhniy on 14.12.2024.
//

import Foundation

import SwiftUI

class SubscriptionViewModel: ObservableObject {
    @Published var plans: [SubscriptionPlan] = [
        SubscriptionPlan(title: "Ежегодно", price: "₽199/мес", totalPrise: "2388₽", sale: "-40%"),
        SubscriptionPlan(title: "6 месяцев", price: "₽499/мес", totalPrise: "123", sale: "-20%"),
        SubscriptionPlan(title: "3 месяца ", price: "₽999/мес", totalPrise: "123", sale: "-10%"),
        SubscriptionPlan(title: "Ежемесячно ", price: "₽349/мес", totalPrise: " ", sale: "")
    ]
    @Published var selectedPlan: SubscriptionPlan?
}

