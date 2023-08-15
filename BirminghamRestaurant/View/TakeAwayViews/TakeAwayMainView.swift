//
//  TakeAwayOrderView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct TakeAwayMainView: View {
    @StateObject var order = Order()
    
    
    var body: some View {
        TabView {
            TakeAwayMenuView(order: order)
                .tabItem {
                    Label("Menu", systemImage: "menucard.fill")
                }

            TakeAwayOrderView(order: order)
                .tabItem {
                    Label("Order", systemImage: "fork.knife.circle.fill")
                }
                .badge(order.items.count)
        }
    }
}

struct TakeAwayMainView_Previews: PreviewProvider {
    static var previews: some View {
        TakeAwayMainView()
    }
}
