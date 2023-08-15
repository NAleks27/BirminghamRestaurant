//
//  Order.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

class Order: ObservableObject, Identifiable, Equatable {
    static func == (lhs: Order, rhs: Order) -> Bool {
        lhs.items == rhs.items
    }
    
    @Published var items = [MenuItem]()
    @Published var status: StatusOrder = .open
    
    var type: TypeOrder = .tableOrder
    let date = Date.now.formatted(date: .long, time: .omitted)
    let number = Int.random(in: 1...150)
    var tableNumber = 1
    
    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }
    
    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
    func sortingOrder() {
        switch self.status {
        case .open:
            if !OrdersHistoryView.currentOrders.contains(self) { OrdersHistoryView.currentOrders.append(self) }
        case .close: OrdersHistoryView.archiveOrders.append(self)
        }
    }
    
    func tranferToArchive() {
        self.status = .close
        self.sortingOrder()
        if !OrdersHistoryView.currentOrders.isEmpty {
            OrdersHistoryView.currentOrders.removeFirst()
        }
    }
}
// -----------------------------------------------------------------
extension Order {
    enum StatusOrder {
        case open
        case close
    }
    
    enum TypeOrder {
        case takeAwayOrder
        case tableOrder
    }
}
