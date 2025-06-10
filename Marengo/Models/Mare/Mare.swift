//
//  Jument.swift
//  Marengo
//
//  Created by Sebastien Besse on 01/06/2025.
//

import Foundation

class Mare: Horse, Identifiable{
    let id = UUID()
    var foal: Foal
    
    init(name: String, age: UInt8, image: String, discipline: Discipline, foal: Foal) {
        self.foal = foal
        super.init(name: name, age: age, image: image,imageP: image, discipline: discipline)
    }
}
