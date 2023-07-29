//
//  NewReservView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI


struct NewReservView: View {
    @State private var isPresentOrdered = false
    @State private var tapBtn = false
    @State private var color: Color = .brown
    @State var tableNumber = 0

    let columns = [
        GridItem(.adaptive(minimum: 180, maximum: 180))
    ]
    // ------------------------------------

    @StateObject var reservTable = Order()

    var body: some View {
            ZStack {
                Image("MainPhoto")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                    .padding(.leading, 55)

                Color.black
                    .opacity(0.8)

                VStack {
                    Text("CHOOSE A FREE TABLE")

                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(1..<11) { number in
                                if number % 3 == 0 {
                                    Button {
                                        tableNumber = number
                                    } label: {
                                        TableReserveView(tapBtn: tapBtn, number: number)
                                    }
                                    .disabled(true)
                                } else {
                                    Button {
                                        tableNumber = number
                                        tapBtn = true
                                    } label: {
                                        TableReserveView(tapBtn: tapBtn, number: number)
                                    }
                                }
                            }
                        }
                    }

                    Spacer()

                    Button(tapBtn ? "To order \"Table №\(tableNumber)\"" : "Chose table") {
                        isPresentOrdered.toggle()
                    }
                    .frame(width: 300, height: 50)
                    .background(.green)
                    .clipShape(Capsule())
                    .disabled(tableNumber == 0 ? true : false)
                    .alert("Ordered \"Table\"\(tableNumber)", isPresented: $isPresentOrdered) {
                        Button("Cancel", role: .cancel) { }
                        Button("OK") {
                            reservTable.tableNumber = tableNumber
//                            reservTable.sortingOrder()
                            OrdersHistoryView.currentOrders.append(reservTable)
                        }
                    } message: {
                        Text("Are you sure?")
                    }
                }
            }
            .foregroundColor(.white)
    }
}

struct NewReservView_Previews: PreviewProvider {
    static var previews: some View {
        NewReservView()
    }
}
