//
//  Horse.swift
//  Marengo
//
//  Created by Sebastien Besse on 01/06/2025.
//

import Foundation

class Horse {
    var name: String
    var age: UInt8
    var image: String
    var imageP: String
    var discipline: Discipline
    
    init(name: String, age: UInt8, image: String, imageP: String, discipline: Discipline) {
        self.name = name
        self.age = age
        self.image = image
        self.imageP = imageP
        self.discipline = discipline
    }
}
