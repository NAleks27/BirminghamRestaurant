//
//  MenuView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 22.07.2023.
//

import SwiftUI

struct MenuView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            NavigationLink {
                                ItemDetails(item: item)
                            } label: {
                                ItemRow(item: item)
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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
