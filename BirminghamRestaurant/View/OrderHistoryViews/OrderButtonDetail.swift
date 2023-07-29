//
//  OrderButtonDetail.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 28.07.2023.
//

import SwiftUI

struct OrderButtonDetail: View {
    @ObservedObject var order: Order
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.brown).brightness(-0.2)
            
            HStack(spacing: 10) {
                    Text(order.date)
                        .padding()
                        .font(.title3)
                        .multilineTextAlignment(.center)
                
                Group {
                    order.type == .tableOrder ?
                    Text("Table number: \(order.tableNumber)") :
                    Text("Order number: \(order.number)")
                }
                .font(.subheadline)
                .frame(width: 90)
                
                Text("\(order.total)$")
                    .padding()
                    .font(.title)
            }
            .foregroundColor(.white)
        }
        .frame(width: 350, height: 100)
    }
}

struct OrderButtonDetail_Previews: PreviewProvider {
    static var previews: some View {
        OrderButtonDetail(order: Order())
    }
}
