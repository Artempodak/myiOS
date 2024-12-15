//
//  SubscriptionPlan.swift
//  connected
//
//  Created by Artem Podorozhniy on 14.12.2024.
//

import Foundation

struct SubscriptionPlan: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let price: String
    let totalPrise : String
    let sale : String

    static func == (lhs: SubscriptionPlan, rhs: SubscriptionPlan) -> Bool {
        return lhs.id == rhs.id
    }
}
