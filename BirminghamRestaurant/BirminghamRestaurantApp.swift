//
//  BirminghamRestaurantApp.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 22.07.2023.
//

import SwiftUI

@main
struct BirminghamRestaurantApp: App {
//    @StateObject var basket = Basket()
//    @StateObject var order = Order()
    @StateObject var favorites = Favorites()
   
    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environmentObject(order)
//                .environmentObject(basket)
                .environmentObject(favorites)
        }
    }
}
