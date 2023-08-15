//
//  ContactsView.swift
//  BirminghamRestaurant
//
//  Created by Aleksey Nosik on 24.07.2023.
//

import SwiftUI
import MapKit

struct DetailsContactsView: View {
    @Environment(\.openURL) var openURL

    let text: String
    let link: String
    let image: Image
    
    var body: some View {
        Section {
        } header: {
            HStack {
                Text(text)
                Spacer()
                
                Button {
                    openURL(URL(string: link)!)
                } label: {
                    image
                        .resizable()
                        .frame(width: 30, height: 30)
                        .cornerRadius(5)
                }
            }
        }
    }
}

struct ContactsView: View {
    @State private var region = MKCoordinateRegion()
    
    let coordinate = CLLocationCoordinate2D(latitude: 50.418_66, longitude: 30.489_23)
    
    let contacts = Contacts(adress: "Kyiv, maidan Nezalezhnosti, 12",
                            schedule: "10:00 - 23:00",
                            phoneNumber: "+38 073 123 4567",
                            email: "birminghham@gmail.com",
                            site: "https://goodtime.kh.ua/",
                            instagram: "https://www.instagram.com/alekseynosik/?hl=ru",
                            pinterest: "https://www.pinterest.com/",
                            facebook: "https://www.facebook.com/aleksey.nosik/")
    
    var body: some View {
        ZStack {
            VStack {
                Map(coordinateRegion: $region)
                    .onAppear() {
                        setRegion(coordinate)
                    }
                    .frame(width: 400, height: 400)
                    
                                
                Divider()
                Form {
                    DetailsContactsView(text: "Adress\n\(contacts.adress)", link: contacts.instagram, image: Image("instagram"))
                    DetailsContactsView(text: "Open/Closed\n\(contacts.schedule)", link: contacts.pinterest, image: Image("pinterest"))
                    DetailsContactsView(text: "Phone number\n\(contacts.phoneNumber)", link: contacts.facebook, image: Image("facebook"))
                    DetailsContactsView(text: "Email\n\(contacts.email)", link: contacts.email, image: Image(systemName: "phone.circle.fill"))
                }
                .font(.subheadline)
                .foregroundColor(.brown)
            }
        }
    }
    
    private func setRegion(_ coordinates: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
        )
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
