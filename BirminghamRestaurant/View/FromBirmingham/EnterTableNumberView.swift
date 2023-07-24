//
//  EnterTableNumberView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct EnterTableNumberView: View {
    @EnvironmentObject var order: Order
    
    @State private var table = 1
    
    var body: some View {
        VStack {
            Picker("Number of table", selection: $table) {
                ForEach(1..<11, id: \.self) { number in
                    Text("\(number)")
                        .foregroundColor(.brown)
                }
            }
            .pickerStyle(.wheel)
            
            Button {
                // ---------------
                order.number = table
            } label: {
                NavigationLink("OK", destination: MenuMainView())
            }
            .buttonStyle(.bordered)
            .foregroundColor(.brown)
        }
        
    }
}

struct EnterTableNumberView_Previews: PreviewProvider {
    static var previews: some View {
        EnterTableNumberView()
            .environmentObject(Order())
    }
}
