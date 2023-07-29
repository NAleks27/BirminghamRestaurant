//
//  TakeAwayOrderView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct TakeAwayOrderView: View {    
    @State private var showingChekoutView = false
    @State private var isCallingWaiter = false
    
    @ObservedObject var order: Order
    
    var body: some View {
        VStack {
            ZStack {
                Image("stack-o-pancakes")
                    .resizable()
                
                Color.black
                    .opacity(0.6)
                
                Text("My current order №\(order.number)")
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
                .onDelete(perform: deleteItems)
            }
                        
            Section {
                HStack {
                    Text("Check sum: \(order.total)$")
                    Spacer()
                    
                    Button("Confirm order") {
                        order.type = .takeAwayOrder
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
            TakeAwayCheckoutView(order: order)
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct TakeAwayOrderView_Previews: PreviewProvider {
    static var previews: some View {
        TakeAwayOrderView(order: Order())
    }
}
