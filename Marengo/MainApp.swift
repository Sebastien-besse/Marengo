//
//  MainApp.swift
//  Marengo
//
//  Created by Thibault on 30/05/2025.
//

import SwiftUI

struct MainApp: View {
    
    var body: some View {
        TabView{
            
            Tab("Etalons", image: "StallionIcon"){
                AdvertisementView()
            }
            Tab("Mes chevaux", image: "HorseIcon"){
                ProfileView()
            }
            
            Tab("Evènements", systemImage: "calendar"){
                EventsView(date: Date(), event: events[0])
            }
            Tab("Discussions", systemImage: "message.fill"){
                ListConversationView(contact: listConversation
            )}
            }
    }
}

#Preview {
    MainApp()
}
