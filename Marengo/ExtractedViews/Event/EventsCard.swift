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
                .scaledToFill()
                .frame(width: 150)
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(
                    topLeading: 20,
                    bottomLeading: 20
                )))
                
          
            
            VStack(alignment: .leading){
                
                Text(event.name)
                    .foregroundStyle(.brownText)
                    .bold()
                    .font(.system(size: 18))
                    .padding(.bottom, 2)
                
                Text(event.description)
                    .foregroundStyle(.brownText)
                    .font(.system(size: 14))
                    .padding(.bottom)
                    .padding(.trailing, 4)
                    .multilineTextAlignment(.leading)
//                    .lineLimit(2)
//                    .truncationMode(.tail)
                    
                
                HStack{
                    HStack{
                        Image(systemName: "calendar")
                        Text(event.date, format: .dateTime.day().month().year())
                            .environment(\.locale, .init(identifier: "fr_FR"))
                            .font(.system(size: 15))

                    }
                    
                    HStack{
                        Image(systemName: "mappin.and.ellipse")
                        Text(event.city)
                            .padding(.trailing)
                            .font(.system(size: 15))
                    }
                }.lineLimit(1)
                    .truncationMode(.tail)
            }
            Spacer()
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.brownStroke, lineWidth: 2)
        ).frame(width: 365, height: 115)
            .padding(.horizontal, 1)
        .padding(.vertical, 5)
        
        
    }
}

#Preview {
    EventsCard(event: events[0])
}
