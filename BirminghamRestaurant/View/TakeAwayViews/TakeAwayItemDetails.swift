//
//  TakeAwayItemDetails.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct TakeAwayItemDetails: View {
    @ObservedObject var order: Order
    
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
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            .padding(.bottom, 40)
            
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TakeAwayItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        TakeAwayItemDetails(order: Order(), item: MenuItem.example)
    }
}
