//
//  TakeAwayView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct TakeAwayView: View {
    @State private var isPresentedConfirmation = false
    @StateObject var order = Order()

    var body: some View {
        VStack {
            MenuMainView()

//            if order.items.count > 0 {
//                Button {
//                    isPresentedConfirmation.toggle()
//                    order.name = .Order
//                } label: {
//                    VStack {
//                        Spacer()
//
//                        ZStack {
//                            RoundedRectangle(cornerRadius: 50)
//                                .fill(.brown)
//                                .frame(width: 300, height: 60)
//
//                            HStack(alignment: .center) {
//                                ZStack {
//                                    Image(systemName: "basket.fill")
//                                        .resizable()
//                                        .frame(width: 30, height: 30)
//
//                                    Image(systemName: "\(order.dishes.count).circle.fill")
//                                        .resizable()
//                                        .frame(width: 20, height: 20, alignment: .bottomTrailing)
//                                        .foregroundColor(.black)
//                                }
//                                .frame(width: 40, height: 40)
//                                .foregroundColor(.white)
//
//                                Text("Order: \(order.sum) UAH")
//                                    .font(.title3)
//                                    .foregroundColor(.white)
//
//
//                            }
//                        }
//                    }
//                    .frame(width: 400, height: 50)
//
//                }
//                .sheet(isPresented: $isPresentedConfirmation) {
////                    InfoOrderView(table: order)
//                }
//            }
        }
    }
}

struct TakeAwayView_Previews: PreviewProvider {
    static var previews: some View {
        TakeAwayView()
    }
}
