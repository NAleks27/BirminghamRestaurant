//
//  NewReservView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct TableReserveView: View {
    var tapBtn: Bool
    @State var number: Int

    var body: some View {
        ZStack {
            if number % 3 == 0 {
                ZStack {
                    Image("Table")
                        .resizable()
                        .frame(width: 110, height: 110)
                        .brightness(-0.3)
                                        
                    Text("Table \(number)")
                        .foregroundColor(.white)
                }
            } else {
                ZStack {
                    Image("Table")
                        .resizable()
                        .frame(width: 110, height: 110)
                    
                    Text("Table \(number)")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ReservationView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var isPresentOrdered = false
    @State private var tapBtn = false
    @State var tableNumber = 0

    let columns = [
        GridItem(.adaptive(minimum: 180, maximum: 180))
    ]

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
                            reservTable.sortingOrder()
                            dismiss()
                        }
                    } message: {
                        Text("Are you sure?")
                    }
                }
            }
            .foregroundColor(.white)
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView()
    }
}
