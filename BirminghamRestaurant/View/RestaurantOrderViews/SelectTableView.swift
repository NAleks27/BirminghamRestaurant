//
//  EnterTableNumberView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct SelectTableView: View {
    @StateObject var order = Order()
        
    var body: some View {
        VStack {
            Picker("Number of table", selection: $order.tableNumber) {
                ForEach(1..<11, id: \.self) { number in
                    Text("\(number)")
                        .foregroundColor(.brown)
                }
            }
            .pickerStyle(.wheel)
            
            Button {
//                TestOrdersHistoryView.currentOrders.append(order)
//                order.sortingOrder()
            } label: {
                NavigationLink("OK", destination: MainView(order: order))
            }
            .buttonStyle(.bordered)
            .foregroundColor(.brown)
        }
        
    }
}

struct SelectTableView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTableView()
    }
}
