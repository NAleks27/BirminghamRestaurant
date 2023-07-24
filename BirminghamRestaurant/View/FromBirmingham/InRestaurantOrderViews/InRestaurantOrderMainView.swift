//
//  InRestaurantOrderView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct InRestaurantOrderMainView: View {
    @ObservedObject var order: Order
    
    @StateObject var basket = Basket()
    
    var body: some View {
        TabView {
            InRestaurantOrderMenuView(basket: basket)
                .tabItem {
                    Label("Menu", systemImage: "menucard.fill")
                }
            
            InRestaurantOrderBasketView(basket: basket, order: order)
                .tabItem {
                    Label("Basket", systemImage: "cart.fill")
                }
                .badge(basket.items.count)
            
            InRestaurantOrderView(order: order)
                .tabItem {
                    Label("My Table", systemImage: "fork.knife.circle.fill")
                }
                .badge(order.items.count)
        }
    }
}

struct InRestaurantOrderMainView_Previews: PreviewProvider {
    static var previews: some View {
        InRestaurantOrderMainView(order: Order())
    }
}
