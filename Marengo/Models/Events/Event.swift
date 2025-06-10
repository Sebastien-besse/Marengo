//
//  Events.swift
//  Marengo
//
//  Created by YacineBahaka  on 04/06/2025.
//

import SwiftUI

struct Event: Identifiable {
    let id: UUID = UUID()
    var name: String
    var description: String
    var date: Date
    var dateString : String {
            var dateEvent = ""
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "fr_FR")
            formatter.dateFormat = "dd MMMM yyyy"
            let formattedDate = formatter.string(from: date)
            dateEvent = formattedDate
            
            return dateEvent
        }
    var city: String
    var image: String
    var price: Double
    var nbPlaces: UInt8?
}
