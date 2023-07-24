//
//  InRestaurantOrderMenuViewView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct MenuView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    @ObservedObject var basket: Basket
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            NavigationLink {
                                ItemDetailsView(basket: basket, item: item)
                            } label: {
                                ItemRowView(basket: basket, item: item)
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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(basket: Basket())
    }
}
