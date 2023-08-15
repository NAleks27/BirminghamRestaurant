//
//  AppMainView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct BirminghamMainView: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 180, maximum: 180))
    ]
    
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
                
                VStack {
                    ButtonsMainScreen(text: "My tables and orders",
                                      view: "OrdersHistoryView",
                                      width: 340,
                                      height: 50,
                                      radius: 15,
                                      fontSize: 20)
                    
                    LazyVGrid(columns: columns) {
                        ButtonsMainScreen(text: "Table\nreserv", view: "ReservationView")
                        ButtonsMainScreen(text: "Take\naway", view: "TakeAwayMainView")
                        ButtonsMainScreen(text: "Enter table number", view: "SelectTableView")
                        ButtonsMainScreen(text: "Contacts", view: "ContactsView")
                    }
                    
                    Spacer()
                    
                    HStack (spacing: 15) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.white)
                                .frame(width: 230, height: 80)
                            
                            VStack(alignment: .leading) {
                                Text("Wi-Fi:")
                                    .font(.title2)
                                
                                Text("Name: Birmingham")
                                Text("Password: birminghamPub")
                            }
                            .foregroundColor(.white)
                        }
                        
                        Button {
                            copying()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.brown).brightness(-0.3)
                                    .frame(width: 80, height: 80)
                                
                                Text("Copy pass")
                                    .font(.title3)
                                    .frame(width: 80, height: 80)
                            }
                            .foregroundColor(.white)
                        }
                    }
                }
                .padding(.top, 20)
            }
        }
        .navigationTitle("BIRMINGHAM")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func copying() {
        let copying = UIPasteboard.general
        copying.string = "birminghamPub"
    }
}

struct BirminghamMainView_Previews: PreviewProvider {
    static var previews: some View {
        BirminghamMainView()
    }
}
