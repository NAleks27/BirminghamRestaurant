//
//  ContentView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 22.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AppMainView()
//        MenuMainView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Order())
            .environmentObject(Basket())
    }
}
