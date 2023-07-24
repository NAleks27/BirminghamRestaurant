//
//  AppMainView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI

struct AppMainView: View {
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
                
                Group {
                    VStack {
                        ButtonsMainScreen(text: "My tables and orders",
                                          view: "OrdersHistoryView",
                                          width: 340,
                                          height: 50,
                                          radius: 15,
                                          fontSize: 20)
                        
                        HStack(spacing: 30) {
                            ButtonsMainScreen(text: "Table\nreserv",
                                              view: "ReservationView")
                            
                            ButtonsMainScreen(text: "Take\naway",
                                              view: "TakeAwayMainView")
                        }
                        .padding(.bottom, 20)
                        
                        HStack(spacing: 30) {
                            ButtonsMainScreen(text: "Enter table number",
                                              view: "SelectTableView")
                            
                            ButtonsMainScreen(text: "Contacts",
                                              view: "ContactsView")
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
                }
            }
            .navigationTitle("BIRMINGHAM")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func copying() {
        let copying = UIPasteboard.general
        copying.string = "birminghamPub"
    }
}

struct AppMainView_Previews: PreviewProvider {
    static var previews: some View {
        AppMainView()
    }
}
