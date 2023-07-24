//
//  TakeAwayOrderView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct TakeAwayOrderView: View {
    @EnvironmentObject var basket: Basket
    
    @State private var showingChekoutView = false
    @State private var isCallingWaiter = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("stack-o-pancakes")
                    .resizable()
                
                Color.black
                    .opacity(0.6)
                
                Text("My current order #\(basket.total)")
                    .foregroundColor(.white)
                    .font(.title)
            }
            .frame(width: .infinity, height: 200)
            
            List {
                ForEach(basket.items) { item in
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
                    Text("Check sum: \(basket.total)$")
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
                    .disabled(basket.items.isEmpty)
                }
            }
            .padding(10)
        }
        .sheet(isPresented: $showingChekoutView) {
            CheckoutView()
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        basket.items.remove(atOffsets: offsets)
    }
}

struct TakeAwayOrderView_Previews: PreviewProvider {
    static var previews: some View {
        TakeAwayOrderView()
            .environmentObject(Basket())
    }
}
