//
//  CurrentTakeAwayView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 29.07.2023.
//

import SwiftUI

struct InfoOrderView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var order: Order
    
    var body: some View {
        VStack {
            ZStack {
                Image("stack-o-pancakes")
                    .resizable()
                
                Color.black
                    .opacity(0.6)
                VStack {
                    Group {
                        order.type == .tableOrder ?
                        Text("Table №\(order.tableNumber)") :
                        Text("Order №\(order.number)")
                    }
                    .foregroundColor(.white)
                    .font(.title)
                    
                    Text(order.date)
                        .foregroundColor(.white)
                        .font(.subheadline)
                }
            }
            .frame(width: .infinity, height: 200)
            
            List {
                ForEach(order.items) { item in
                    HStack {
                        Image(item.mainImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70)
                            .cornerRadius(10)
                            .shadow(radius: 15)
                        
                        Text(item.name)
                        Text("\(item.price)$")
                    }
                }
            }
            
            Section {
                HStack {
                    Text("Check sum: \(order.total)$")
                    if order.status == .open {
                        Spacer()
                        
                        Button("Done") {
                            order.tranferToArchive()
                            dismiss()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                        .disabled(order.items.isEmpty)
                    }
                }
            }
            .padding(10)
        }
    }
}

struct InfoOrderView_Previews: PreviewProvider {
    static var previews: some View {
        InfoOrderView(order: Order())
    }
}
