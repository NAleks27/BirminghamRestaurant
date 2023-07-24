//
//  OrdersHistoryView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct OrdersHistoryView: View {
    @State private var pickerChoice = "Current"
    @State private var isPresentDetailView = false
    
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
                    .padding(.leading, 55)
                
                Color.black
                    .opacity(0.8)
                
                VStack (spacing: 10) {
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
                    
//                    if pickerChoice == "Current" {
//                        ForEach(OrdersHistoryView.currentOrders.reversed()) { order in
//                            Button {
//                                isPresentDetailView.toggle()
//                            } label: {
//                                ZStack {
//                                    RoundedRectangle(cornerRadius: 20)
//                                        .fill(.brown)
//                                        .frame(width: 350, height: 100)
//                                    
//                                    HStack (spacing: 30) {
//                                        Text("\(order.name.rawValue) \(order.number)")
//                                            .foregroundColor(.white)
//                                            .font(.title2)
//                                            
//                                        
//                                        VStack (alignment: .trailing) {
//                                            Text(order.date)
//                                            Text("Check sum: \(order.sum) UAH")
//                                                .multilineTextAlignment(.leading)
//                                        }
//                                        .foregroundColor(.white)
//                                    }
//                                }
//                                .frame(width: 300, height: 100)
//                            }
//                            .sheet(isPresented: $isPresentDetailView) {
////                                MyTableMainView(table: order)
//                            }
//                        }
//                    } else if pickerChoice == "Archive" {
//                        ForEach(OrdersHistoryView.archiveOrders.reversed()) { order in
//                            Button {
//                                isPresentDetailView.toggle()
//                            } label: {
//                                ZStack {
//                                    RoundedRectangle(cornerRadius: 20)
//                                        .fill(.gray)
//                                        .frame(width: 350, height: 100)
//                                    
//                                    HStack (spacing: 30) {
//                                        Text("\(order.name.rawValue) \(order.number)")
//                                            .foregroundColor(.white)
//                                            .font(.title)
//                                        
//                                        
//                                        VStack (alignment: .leading) {
//                                            Text(order.date)
//                                            Text("Check sum:\n\(order.sum) UAH")
//                                                .multilineTextAlignment(.leading)
//                                        }
//                                        .foregroundColor(.white)
//                                    }
//                                }
//                            }
//                            .sheet(isPresented: $isPresentDetailView) {
//                                OrderHistoryDetailsView(order: order)
//                            }
//                        }
//                    }
                    
                    Spacer()
                }
                .navigationTitle("MY TABLES, ORDERS, RESERVINGS")
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
