//
//  EventsCard.swift
//  Marengo
//
//  Created by YacineBahaka  on 05/06/2025.
//

import SwiftUI

struct EventsCard: View {
    let event: Event
    var body: some View {
        HStack {
            Image(event.image)
                .resizable()
                .scaledToFit()
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(
                    topLeading: 20,
                    bottomLeading: 20
                )))
            
            VStack{
                Text(event.name)
                
                Text(event.description)
                
                HStack{
                    Text(event.dateString)
                    
                    Text(event.city)
                }.padding()
            }
            
        }.overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.brownStroke, lineWidth: 2)
            )
            .frame(width: 365, height: 115)
            .padding()
        
            
    }
}

#Preview {
    EventsCard(event: events[0])
}
