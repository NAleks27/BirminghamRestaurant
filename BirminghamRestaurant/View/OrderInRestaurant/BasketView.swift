//
//  AddingItemsView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 23.07.2023.
//

import SwiftUI

struct BasketView: View {
    @EnvironmentObject var basket: Basket

    @State private var showingConfirmationBasketView = false
    
    @State private var mainOrder = [MenuItem]()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("stack-o-pancakes")
                    .resizable()
                
                Color.black
                    .opacity(0.6)
                
                Text("Basket")
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
                    Text("Total sum: \(basket.total)$")
                    Spacer()
                    Button("Add to the check") {
                        showingConfirmationBasketView = true
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(basket.items.isEmpty)
                }
            }
            .padding(10)
        }
        .sheet(isPresented: $showingConfirmationBasketView) {
            ConfirmationBasketView()
                .presentationDetents([.fraction(0.2)])
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        basket.items.remove(atOffsets: offsets)
    }
}

struct AddingItemsView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
            .environmentObject(Basket())
    }
}
