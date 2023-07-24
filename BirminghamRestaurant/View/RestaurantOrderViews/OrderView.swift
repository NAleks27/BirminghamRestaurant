//
//  InRestaurantOrderView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var order: Order
    
    @State private var showingChekoutView = false
    @State private var isCallingWaiter = false
    
    var body: some View {
        VStack {
            ZStack {
                Image("stack-o-pancakes")
                    .resizable()
                
                Color.black
                    .opacity(0.6)
                
                Text("My current order #\(order.number)")
                    .foregroundColor(.white)
                    .font(.title)
            }
            .frame(width: .infinity, height: 200)
            
            List {
                ForEach(order.items) { item in
                    HStack {
                        Image(item.mainImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70)
                            .cornerRadius(10)
                            .shadow(radius: 15)
                        
                        Text(item.name)
                        Text("\(item.price)$")
                    }
                }
            }
            
            Section {
                HStack {
                    Text("Check sum: \(order.total)$")
                    Spacer()
                    
                    Button("Waiter 🔔") {
                        isCallingWaiter.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.brown)
                    .alert("Please wait. The waiter will come as soon as possible.", isPresented: $isCallingWaiter) { }
                    
                    Button("Pay check") {
                        showingChekoutView.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                    .disabled(order.items.isEmpty)
                }
            }
            .padding(10)
        }
        .sheet(isPresented: $showingChekoutView) {
            CheckoutView(order: order)
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(order: Order())
    }
}
