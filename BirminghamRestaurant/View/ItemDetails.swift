//
//  ItemDetails.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 22.07.2023.
//

import SwiftUI

struct ItemDetails: View {
    @EnvironmentObject var basket: Basket
//    @EnvironmentObject var order: Order
    
    let item: MenuItem
    
    var body: some View {
        VStack {
            Image(item.mainImage)
                .resizable()
                .scaledToFit()
            
            Text(item.description)
                .padding()
            
            Text("\(item.price)$")
                .frame(width: 80, height: 40)
                .foregroundColor(.black)
                .background(.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
            
            Button("Add to basket") {
                basket.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            .padding(.bottom, 40)
            
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetails(item: MenuItem.example)
//            .environmentObject(Order())
            .environmentObject(Basket())
    }
}
