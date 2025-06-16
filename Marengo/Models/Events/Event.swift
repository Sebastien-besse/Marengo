//
//  Events.swift
//  Marengo
//
//  Created by YacineBahaka  on 04/06/2025.
//

import SwiftUI

struct Event: Hashable, Identifiable {
    let id: UUID = UUID()
    var name: String
    var description: String
    var date: Date
    var city: String
    var image: String
    var price: Double
    var nbPlaces: UInt8?
}
