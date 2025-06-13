//
//  EventViewModel.swift
//  Marengo
//
//  Created by YacineBahaka  on 11/06/2025.
//

import SwiftUI

@Observable
class EventViewModel {
    //    var event: Event
    //    @State private var isSelected: Date
    var allEvents = events
    var searchText = ""
    
    var filterEventsByDate: [Event] {
        let isSelected = Date()
        let eventsByDate =  events.filter{$0.date == isSelected}
        return eventsByDate.isEmpty ? events : eventsByDate
    }
    
//    var filterEvents: [Stallion] {
//        var filteredEvents = allEvents
//        
//        // Filtrer par texte de recherche
//        if !searchText.isEmpty {
//            filteredEvents = filteredEvents.filter { event in
//                event.name.localizedCaseInsensitiveContains(searchText)
//            }
//            events = filteredEvents
//        }
//    }
    
    var filterEvents: [Event] {
        if searchText.isEmpty {
            return allEvents
        } else {
            return allEvents.filter { $0.city.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

