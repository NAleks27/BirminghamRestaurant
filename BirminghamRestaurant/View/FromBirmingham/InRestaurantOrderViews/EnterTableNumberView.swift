//
//  EnterTableNumberView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct EnterTableNumberView: View {
    @StateObject var order = Order()
        
    var body: some View {
        VStack {
            Picker("Number of table", selection: $order.number) {
                ForEach(1..<11, id: \.self) { number in
                    Text("\(number)")
                        .foregroundColor(.brown)
                }
            }
            .pickerStyle(.wheel)
            
            Button {
            } label: {
                NavigationLink("OK", destination: InRestaurantOrderMainView(order: order))
            }
            .buttonStyle(.bordered)
            .foregroundColor(.brown)
        }
        
    }
}

struct EnterTableNumberView_Previews: PreviewProvider {
    static var previews: some View {
        EnterTableNumberView()
    }
}
