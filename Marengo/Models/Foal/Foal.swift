//
//  Foal.swift
//  Marengo
//
//  Created by YacineBahaka  on 04/06/2025.
//

import SwiftUI

class Foal {
    var caracteristic: [Caracteristic]
    var discipline: Discipline
    
    init(caracteristic: [Caracteristic], discipline: Discipline) {
        self.caracteristic = caracteristic
        self.discipline = discipline
    }
}
