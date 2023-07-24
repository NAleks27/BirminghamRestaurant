//
//  InRestaurantOrderMenuViewView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct InRestaurantOrderMenuView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    @ObservedObject var basket: Basket
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            NavigationLink {
                                InRestaurantOrderItemDetailsView(basket: basket, item: item)
                            } label: {
                                InRestaurantOrderItemRowView(basket: basket, item: item)
                            }
                        }
                    }
                    .foregroundColor(.brown)

                }
            }
            .listStyle(.inset)
        }
    }
}

struct InRestaurantOrderMenuView_Previews: PreviewProvider {
    static var previews: some View {
        InRestaurantOrderMenuView(basket: Basket())
    }
}
