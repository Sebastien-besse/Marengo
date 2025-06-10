//
//  EventsData.swift
//  Marengo
//
//  Created by YacineBahaka  on 05/06/2025.
//

import Foundation

let eventDateFormatter: DateFormatter = {
   let formatter = DateFormatter()
    formatter.dateFormat = "dd MMMM yyyy"
    return formatter
}()

var events: [Event] = [
    Event(name: "Cours de Massage", description: "Venez apprendre à soulager les douleurs des juments gestantes", date: eventDateFormatter.date(from: "06/06/2025") ?? Date(), city: "Lille", image: "horse1", price: 20.00),
    Event(name: "Concours de Cross", description: "Un étalon vous intéresse ? Venez le voir concourir", date: Date.now, city: "Lyon", image: "horse9", price: 20.00),
    Event(name: "Présentations des poulains de 2025", description: "Venez rencontrer les poulains nés au haras de Simplon", date: eventDateFormatter.date(from: "15/06/2025") ?? Date(), city: "Paris", image: "horse6", price: 20.00),
    Event(name: "Cours de massage", description: "Venez apprendre quelques techniques pour pouvoir soulager vos étalons et juments", date: eventDateFormatter.date(from: "21/07/2025") ?? Date(), city: "Toulouse", image: "horse3", price: 20.00),
    Event(name: "Salon des étalons", description: "Venez découvrir les meilleurs étalons de France de 2026", date: eventDateFormatter.date(from: "21/02/2026") ?? Date(), city: "Toulouse", image: "horse2", price: 20.00)
]

// Revoir toute les tailles des images
