//
//  InRestaurantOrderItemRowView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct ItemRowView: View {
    @ObservedObject var basket: Basket
        
    let item: MenuItem
    
    var body: some View {
        HStack {
            Image(item.mainImage)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .cornerRadius(10)
                .shadow(radius: 15)
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                
                Text("\(item.price)$")
            }
            
            Spacer()
            
            VStack {
                HStack {
                    Button {
                        basket.remove(item: item)
                    } label: {
                        Image(systemName: "minus.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.red)
                    }
                    .buttonStyle(.borderless)
                    
                    Button {
                        basket.add(item: item)
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.green)
                    }
                    .buttonStyle(.borderless)
                }
            }
        }
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(basket: Basket(), item: MenuItem.example)
    }
}
