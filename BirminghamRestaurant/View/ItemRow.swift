//
//  ItemRow.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 22.07.2023.
//

import SwiftUI

struct ItemRow: View {
    @EnvironmentObject var basket: Basket
//    @EnvironmentObject var order: Order
    
    @State private var isFavorite = false
    
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
            .foregroundColor(.brown).brightness(-0.4)
            
            Spacer()
            
            VStack {
                Button {
                    isFavorite.toggle()
                } label: {
                    if isFavorite {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.yellow)
                    } else {
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.yellow)
                    }
                }
                .buttonStyle(.borderless)
                
                
                
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

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
//            .environmentObject(Order())
            .environmentObject(Basket())
    }
}
