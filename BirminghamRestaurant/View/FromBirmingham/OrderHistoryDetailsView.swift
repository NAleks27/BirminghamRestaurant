//
//  OrderHistoryDetailsView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct OrderHistoryDetailsView: View {
    var order: Order
    
    var body: some View {
        VStack {
//            InfoOrderView(table: order)
        }
    }
}

struct OrderHistoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistoryDetailsView(order: Order())
    }
}
