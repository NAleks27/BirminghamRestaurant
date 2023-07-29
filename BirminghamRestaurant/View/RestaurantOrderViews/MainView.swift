//
//  InRestaurantOrderView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var order: Order
    
    @StateObject var basket = Basket()
    
    var body: some View {
            TabView {
                MenuView(basket: basket)
                    .tabItem {
                        Label("Menu", systemImage: "menucard.fill")
                    }
                
                BasketView(basket: basket, order: order)
                    .tabItem {
                        Label("Basket", systemImage: "cart.fill")
                    }
                    .badge(basket.items.count)
                
                OrderView(order: order)
                    .tabItem {
                        Label("My Table", systemImage: "fork.knife.circle.fill")
                    }
                    .badge(order.items.count)
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(order: Order())
    }
}
