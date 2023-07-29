//
//  OrderHistoryDetailsView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct OrderDetailView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        switch order.type {
        case .tableOrder:
            switch order.status {
            case .open: MainView(order: order)
            case .close: InfoOrderView(order: order)
            }
        case .takeAwayOrder: InfoOrderView(order: order)
        }
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView(order: Order())
    }
}
