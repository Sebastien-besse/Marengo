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
    
    var body: some View {
        
        ZStack {
            Color.backgroundApp
                .ignoresSafeArea()
            
            NavigationStack{
                ScrollView{
                VStack{
                    
                    SearchBarEventExtractedView(
                        searchText: $eventsVM.searchText
                        
                    )
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                    
                    HStack{
                        
                        Text("Choisir la date :")
                            .foregroundStyle(.brownText)
                        
                        
                        DatePicker("", selection: $date, displayedComponents: .date)
                            .foregroundStyle(.brownText)
                            .labelsHidden()
                        
                        
                        Spacer()
                        
                        
                        
                    }.padding()
                }.background(Color.backgroundApp)
                
                
                    ForEach(eventsVM.filterEvents){ event in
                        NavigationLink(destination: {
                            EventDetailView(event: event)
                        }, label: {
                            EventsCard(event: event)
                            
                        }).navigationTitle("Evènements")
                        
                    }.background(Color.backgroundApp)
                    
                }
                
                .background(Color.backgroundApp)
            
            }
            .padding()
            
        }
    }
}

#Preview {
    EventsView(date: Date())
}
