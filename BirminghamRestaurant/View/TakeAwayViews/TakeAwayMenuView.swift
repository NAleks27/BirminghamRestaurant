//
//  TakeAwayMenuView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct TakeAwayMenuView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    @ObservedObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            NavigationLink {
                                TakeAwayItemDetails(order: order, item: item)
                            } label: {
                                TakeAwayItemRow(order: order, item: item)
                            }
                        }
                    }
                    .foregroundColor(.brown)
                }
            }
            .navigationTitle("Menu")
            .listStyle(.inset)
        }
    }
}

struct TakeAwayMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TakeAwayMenuView(order: Order())
    }
}
