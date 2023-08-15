//
//  TestOrdersHistoryView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 28.07.2023.
//

import SwiftUI

struct OrdersHistoryView: View {
    @State private var pickerChoice = "Current"
    @State private var isPresentDetailView = false
    
    // нужно использовать стейт или стейт обжект для отслеживания изменений  
    static var currentOrders = [Order]()
    static var archiveOrders = [Order]()
    
    let currentOrArchive = ["Current", "Archive"]
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Image("MainPhoto")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                
                Color.black
                    .opacity(0.8)
                
                VStack(spacing: 10) {
                    Picker("Current or Archive", selection: $pickerChoice) {
                        ForEach(currentOrArchive, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .background(.brown)
                    .cornerRadius(10)
                    .frame(width: 300, height: 20)
                    .padding(.bottom, 15)
                    
                    if pickerChoice == "Current" {
                        ForEach(OrdersHistoryView.currentOrders.reversed()) { order in
                            Button {
                                isPresentDetailView.toggle()
                            } label: {
                                OrderButtonDetail(order: order)
                            }
                            .sheet(isPresented: $isPresentDetailView) {
                                OrderDetailView(order: order)
                            }
                        }
                    } else if pickerChoice == "Archive" {
                        ForEach(OrdersHistoryView.archiveOrders.reversed()) { order in
                            Button {
                                isPresentDetailView.toggle()
                            } label: {
                                OrderButtonDetail(order: order)
                            }
                            .sheet(isPresented: $isPresentDetailView) {
                                OrderDetailView(order: order)
                            }
                        }
                    }
                    Spacer()
                }
                .navigationTitle("-")
                .navigationBarTitleDisplayMode(.inline)
                
            }
        }
    }
}

struct OrdersHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersHistoryView()
    }
}
