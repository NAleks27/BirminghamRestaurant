//
//  InRestaurantOrderCheckoutView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct CheckoutView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var order: Order
    
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    @State private var tipAmount = 10
    @State private var totalTips = 0.0
    @State private var showingPaymentAlert = false
    
    let paymentTypes = ["Cash", "Credit Card"]

    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) { type in
                        switch type {
                        case "Cash": Label(type, systemImage: "banknote")
                        default: Label(type, systemImage: "creditcard")
                        }
                    }
                }
                .pickerStyle(.menu)
                
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            
            Section("Total: \(order.total)$") {
                Button("Confirm order") {
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order confirmed", isPresented: $showingPaymentAlert) {
            Button("OK") {
//                order.status = .close
                order.tranferToArchive()
//                order.type = .tableOrder
//                TestOrdersHistoryView.archiveOrders.append(order)
//                order.items = []
                dismiss()
            }
        } message: {
            paymentType == "Cash" ? Text("Your total was \(order.total)$ - thank you! Wait for the waiter.") :
            Text("Your total was \(order.total)$ - thank you!")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
