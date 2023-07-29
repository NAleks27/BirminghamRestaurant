//
//  Order.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

class Order: ObservableObject, Identifiable {
    @Published var items = [MenuItem]()

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
//    -----------------------------------------------
    enum StatusOrder {
        case open
        case close
    }
    
    enum TypeOrder {
        case takeAwayOrder
        case tableOrder
    }
    
    var status: StatusOrder = .open
    var type: TypeOrder = .tableOrder
    let date = Date.now.formatted(date: .long, time: .omitted)
    
    func sortingOrder() {
        switch self.status {
        case .open: OrdersHistoryView.currentOrders.append(self)
        case .close: OrdersHistoryView.archiveOrders.append(self)
        }
    }
    
    let number = Int.random(in: 1...150)
    var tableNumber = 0
    
    func tranferToArchive() {
        self.status = .close
        self.sortingOrder()
        if !OrdersHistoryView.currentOrders.isEmpty {
            OrdersHistoryView.currentOrders.removeFirst()
        }
    }
}
