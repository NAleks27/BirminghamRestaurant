//
//  ButtonsMainScreen.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI
import CoreLocation

struct ButtonsMainScreen: View {
    @EnvironmentObject var order: Order
    
    var text: String
    var view: String?
    var width: CGFloat?
    var height: CGFloat?
    var radius: CGFloat?
    var fontSize: CGFloat?
        
    var body: some View {
        NavigationLink {
            switch view {
            case "OrdersHistoryView": OrdersHistoryView()
            case "ReservationView": ReservationView()
            case "TakeAwayMainView": TakeAwayMainView()
            case "SelectTableView": SelectTableView()
            case "ContactsView": ContactsView()
            default: ContentView()
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: radius ?? 25)
                    .fill(.brown).brightness(-0.3)
                    .frame(width: (width ?? 150), height: (height ?? 150))
                    .shadow(radius: 3)
                
                VStack(alignment: .leading) {
                    Text(text)
                        .font(.custom("Text", size: fontSize ?? 25))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                }
                .frame(width: width, height: height)
                .lineLimit(nil)
                .frame(width: width ?? 100, height: height)
            }
        }
    }
}

struct ButtonsMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsMainScreen(text: "Test", view: "Con", width: 150, height: 150)
    }
}
