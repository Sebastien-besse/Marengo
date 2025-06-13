//
//  Etalon.swift
//  Marengo
//
//  Created by Sebastien Besse on 01/06/2025.
//

import Foundation

class Stallion: Horse, Identifiable, Observable {
    let id: UUID = UUID()
    var descendent: [Horse]
    var ancestor: [Horse]
    let price: Int
    var isFavorite: Bool = false
    
    
    init(name: String, age: UInt8, image: String, imageP: String, discipline: Discipline,descendent: [Horse], ancestor: [Horse], price: Int, isFavorite: Bool = false, caracteristc: [Caracteristic]) {
        self.descendent = descendent
        self.ancestor = ancestor
        self.price = price
        self.isFavorite = isFavorite
        super.init(name: name, age: age, image: image,imageP: imageP, discipline: discipline, caracteristc: caracteristc)
    }
    
    // Données fixes pour matchPercentage basées sur le nom
    var matchPercentage: Int? {
        switch name {
        case "Petit Tonnerre":
            return 95
        case "Bernard":
            return 78
        case "Rodrigo":
            return 85
        case "Elixir":
            return 92
        default:

            // Génère un pourcentage basé sur le hash du nom pour la cohérence
            let hash = abs(name.hashValue)
            return 50 + (hash % 45) // Entre 50 et 94
        }
    }
}
