//
//  Caracteristic.swift
//  Marengo
//
//  Created by YacineBahaka  on 04/06/2025.
//

import SwiftUI

struct Caracteristic: Identifiable {
    let id: UUID = UUID()
    let name: String
    var rating: RatingCaracteristic
    let min: String
    let max: String
}
