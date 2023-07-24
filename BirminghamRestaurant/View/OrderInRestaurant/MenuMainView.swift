//
//  MainView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 22.07.2023.
//

import SwiftUI

struct MenuMainView: View {
    @EnvironmentObject var basket: Basket
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "menucard.fill")
                }
            
            BasketView()
                .tabItem {
                    Label("Basket", systemImage: "cart.fill")
                }
                .badge(basket.items.count)
            
            OrderView()
                .tabItem {
                    Label("My Table", systemImage: "fork.knife.circle.fill")
                }
                .badge(order.items.count)
        }
    }
}

struct MenuMainView_Previews: PreviewProvider {
    static var previews: some View {
        MenuMainView()
            .environmentObject(Order())
            .environmentObject(Basket())
    }
}
