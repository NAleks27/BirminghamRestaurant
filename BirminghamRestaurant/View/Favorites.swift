//
//  Favorites.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 04.08.2023.
//

import Foundation

class Favorites: ObservableObject, Equatable {
    static func == (lhs: Favorites, rhs: Favorites) -> Bool {
        lhs.favorites == rhs.favorites
    }
    
    @Published var favorites: [MenuItem] = []
        
    func add(item: MenuItem) {
        favorites.append(item)
    }

    func remove(item: MenuItem) {
        if let index = favorites.firstIndex(of: item) {
            favorites.remove(at: index)
        }
    }
}
