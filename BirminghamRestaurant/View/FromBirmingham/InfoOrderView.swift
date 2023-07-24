////
////  InfoOrderView.swift
////  BirminghamRestaurant
////
////  Created by Aleksey Nosik on 24.07.2023.
////
//
//import SwiftUI
//
//struct InfoOrderView: View {
//    @ObservedObject var table: Order
//    
//    var body: some View {
//        VStack {
//            Group {
//                ZStack {
//                    Image("TableImage")
//                        .resizable()
//                        .frame(width: 400, height: 200)
//                    
//                    Color.black
//                        .opacity(0.6)
//                    
//                    Text("\(table.name.rawValue) \(table.number)")
//                        .foregroundColor(.white)
//                        .font(.largeTitle)
//                }
//                .frame(width: 400, height: 200)
//            }
//            
//            Group {
//                HStack {
//                    Spacer()
//                    Text("Dish")
//                    Text("Amount")
//                        .padding(.leading, 40)
//                    Text("Price")
//                        .padding(.leading, 20)
//                    Text("Sum")
//                        .padding(.leading, 40)
//                }
//                .foregroundColor(.secondary)
//                .frame(width: 320, height: 20)
//            }
//            
//            Group {
//                ScrollView {
//                    ForEach(Set(table.dishes).sorted { $0.price < $1.price }) { dish in
////                        MyCurrentDishes(dish: dish)
//                    }
//                }
//            }
//            
//            Group {
//                Section {
//                    HStack {
//                        Text("Total sum:")
//                        Spacer()
//                        Text("\(table.sum) UAH")
//                            .foregroundColor(.green)
//                    }
//                    .padding()
//                }
//            }
//        }
//    }
//}
//
//struct InfoOrderView_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoOrderView(table: Order())
//    }
//}
