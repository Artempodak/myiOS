//
//  PaymentView.swift
//  connected
//
//  Created by Artem Podorozhniy on 14.12.2024.
//

import SwiftUI
import PassKit

struct PaymentView: View {
    let plan: SubscriptionPlan

    var body: some View {
        VStack {
            SubscriptionPlanCardView(plan: plan, isSelected: true)
                .padding()

//            Text(plan.description)
//                .font(.body)
//                .padding()

            Spacer()

            ApplePayButton(action: {
                // Реализация оплаты через Apple Pay
                print("Оплата тарифа \(plan.title)")
            })
            .frame(height: 50)
            .padding()
        }
    }
}

struct ApplePayButton: UIViewRepresentable {
    var action: () -> Void

    func makeUIView(context: Context) -> PKPaymentButton {
        let button = PKPaymentButton(paymentButtonType: .checkout, paymentButtonStyle: .black)
        button.addTarget(context.coordinator, action: #selector(Coordinator.didTap), for: .touchUpInside)
        return button
    }

    func updateUIView(_ uiView: PKPaymentButton, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(action: action)
    }

    class Coordinator: NSObject {
        var action: () -> Void

        init(action: @escaping () -> Void) {
            self.action = action
        }

        @objc func didTap() {
            action()
        }
    }
}
