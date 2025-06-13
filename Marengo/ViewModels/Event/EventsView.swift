//
//  EventsView.swift
//  Marengo
//
//  Created by YacineBahaka  on 05/06/2025.
//
//
import SwiftUI

struct EventsView: View {
    var body: some View {
        NavigationStack{
            ZStack {
                Color.backgroundApp.ignoresSafeArea()
                ScrollView{
                    HStack{
                        Spacer()

                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "calendar")
                        })
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Lieu")
                        })
                        
                        Spacer()
                    }.padding()
                    
                    ForEach(events){ event in
                        EventsCard(event: event)
                    }
                }
            }
        }    }
}

#Preview {
    EventsView()
}
