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
    @FocusState private var isFocused: Bool
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
                    .focused($isFocused)
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
                }
                .onTapGesture {
                    
                    isFocused = false
                    
                }
                .background(Color.backgroundApp)
                
                
                    ForEach(eventsVM.filterEvents){ event in
                        NavigationLink(destination: {
                            EventDetailView(event: event)
                        }, label: {
                            EventsCard(event: event)
                            
                        }).navigationTitle("Evènements")
                        
                    }.background(Color.backgroundApp)
                    
                }
                .scrollIndicators(.hidden)
                .toolbarBackground(Color.backgroundApp.opacity(0.5))
                .padding(.horizontal)
                
                .background(Color.backgroundApp)
                
                
            
            }
            
            
        }
        
    }
}

#Preview {
    EventsView(date: Date())
}
