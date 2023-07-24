//
//  ConfirmationBasketView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 23.07.2023.
//

import SwiftUI

struct ConfirmationBasketView: View {
    @EnvironmentObject var basket: Basket
    @EnvironmentObject var order: Order

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.brown.brightness(-0.4)
                .ignoresSafeArea()
            
            VStack {
                Text("Do you confirm your order?")
                    .font(.headline)
                    .foregroundColor(.white)
                
                HStack(spacing: 50) {
                    Button("No", role: .cancel) {
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)

                    Button("Yes") {
                        order.items += basket.items
                        dismiss()
                        basket.items = []
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                }
                .padding()
            }
        }
        
        
    }
}

struct ConfirmationBasketView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationBasketView()
            .environmentObject(Order())
    }
}
