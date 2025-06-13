//
//  EventsView.swift
//  Marengo
//
//  Created by YacineBahaka  on 05/06/2025.
//
//
import SwiftUI

struct EventsView: View {
    @State private var eventsVM = EventViewModel()
    
    @State var date: Date
    @State private var showDatePicker: Bool = false
    @State private var searchText = ""
    
    var event: Event
    var body: some View {
        
        ZStack {
            Color.backgroundApp.ignoresSafeArea()
            VStack{
                NavigationStack{
                    
//                    SearchBarEventExtractedView(searchText: $eventsVM.searchText, onSearchTextChanged: { _ in
//                        eventsVM.filterEvents()
//                    })
                    SearchBarEventExtractedView(
                        searchText: $eventsVM.searchText,
                        onSearchTextChanged: { _ in
                            eventsVM.filterEvents
                        }
                    )
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                    
                    HStack{
                        
                        Text("Choisir la date :")
                            .foregroundStyle(.brownText)
                        
//                            DatePicker
                            DatePicker("", selection: $date, displayedComponents: .date)
                            .foregroundStyle(.brownText)
                            .labelsHidden()
                            
                            
                        Spacer()
                        
//                        Button(action: {
//                            
//                        }, label: {
//                            Text("Lieu")
//                                .font(.system(size: 25))
//                        })
                        
                    }.padding()
                    
                    
                    
                    ScrollView{
                        ForEach(eventsVM.filterEvents){ event in
                            NavigationLink(destination: {
                                //                            EventDetailView(event: event)
                            }, label: {
                                EventsCard(event: event)
                            }).navigationTitle("Evènements")
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    EventsView(date: Date(), event: events[0])
}
