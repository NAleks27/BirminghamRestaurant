//
//  TakeAwayOrderView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct TakeAwayMainView: View {
    @EnvironmentObject var basket: Basket
    
    var body: some View {
        TabView {
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "menucard.fill")
                }
            
            TakeAwayOrderView()
                .tabItem {
                    Label("Order", systemImage: "fork.knife.circle.fill")
                }
                .badge(basket.items.count)
        }
    }
}

struct TakeAwayMainView_Previews: PreviewProvider {
    static var previews: some View {
        TakeAwayMainView()
            .environmentObject(Basket())
    }
}
