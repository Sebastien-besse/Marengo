//
//  HorseDatabase.swift
//  Marengo
//
//  Created by YacineBahaka  on 03/06/2025.
//
import SwiftUI

var stallions = [
    Stallion(name: "Petit Tonnerre", age: 5, image: "horse1", imageP: "horse1p", discipline: .Dressage, descendent: [], ancestor: [], price: 1500, isFavorite: true),
    Stallion(name: "Bernard", age: 6, image: "horse2", imageP: "horse2p", discipline: .CourseGalop, descendent: [], ancestor: [], price: 1800, isFavorite: true),
    Stallion(name: "Rodrigo", age: 7, image: "horse3", imageP: "horse3p", discipline: .CourseTrot, descendent: [], ancestor: [], price: 2000, isFavorite: true),
    Stallion(name: "Elixir", age: 11, image: "horse10", imageP: "horse10p", discipline: .CSO, descendent: [], ancestor: [], price: 10000),
    Stallion(name: "Pedrolito", age: 4, image: "horse8", imageP: "horse8p", discipline: .CourseTrot, descendent: [], ancestor: [], price: 1100, isFavorite: true),
    Stallion(name: "Potion", age: 4, image: "horse9", imageP: "horse9p", discipline: .CSO, descendent: [], ancestor: [], price: 1250)
]

var mares = [
    Mare(name: "Pupuce", age: 8, image: "horse4", discipline: .Dressage, foal: foal1),
    Mare(name: "Angel", age: 11, image: "horse5", discipline: .CSO, foal: foal2),
    Mare(name: "Valerie", age: 10, image: "horse6", discipline: .CourseGalop, foal: foal3),
    Mare(name: "Micheline", age: 5, image: "horse7", discipline: .CourseTrot, foal: foal4)
]
