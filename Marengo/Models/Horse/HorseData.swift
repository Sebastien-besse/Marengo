//
//  HorseDatabase.swift
//  Marengo
//
//  Created by YacineBahaka  on 03/06/2025.
//
import SwiftUI

var stallions = [
  Stallion(
        name: "Petit Tonnerre", age: 5, image: "horse1", imageP: "horse1p",
        discipline: .Dressage, descendent: [], ancestor: [], price: 1500, isFavorite: true,
        caracteristc: [
            Caracteristic(name: "Ossature", rating: .five, min: "Légère", max: "Lourde"),
            Caracteristic(name: "Longueur", rating: .five, min: "Courte", max: "Longue"),
            Caracteristic(name: "Courage", rating: .five, min: "Peureux", max: "Courageux")
        ]
    ),
    Stallion(
        name: "Bernard", age: 6, image: "horse2", imageP: "horse2p",
        discipline: .CourseGalop, descendent: [], ancestor: [], price: 1800, isFavorite: true,
        caracteristc: [
            Caracteristic(name: "Élégance tête", rating: .five, min: "Massive", max: "Fine"),
            Caracteristic(name: "Tempérament", rating: .five, min: "Calme", max: "Fougueux")
        ]
    ),
    Stallion(
        name: "Rodrigo", age: 7, image: "horse3", imageP: "horse3p",
        discipline: .CourseTrot, descendent: [], ancestor: [], price: 2000, isFavorite: true,
        caracteristc: [
            Caracteristic(name: "Ossature", rating: .five, min: "Légère", max: "Lourde"),
            Caracteristic(name: "Tempérament", rating: .five, min: "Calme", max: "Fougueux")
        ]
    ),
    Stallion(
        name: "Elixir", age: 11, image: "horse10", imageP: "horse10p",
        discipline: .CSO, descendent: [], ancestor: [], price: 10000,
        caracteristc: [
            Caracteristic(name: "Longueur", rating: .five, min: "Courte", max: "Longue"),
            Caracteristic(name: "Courage", rating: .five, min: "Peureux", max: "Courageux")
        ]
    ),
  Stallion(
      name: "Pedrolito", age: 8, image: "horse5", imageP: "horse5p",
      discipline: .CSO, descendent: [], ancestor: [], price: 2000,
      caracteristc: [
          Caracteristic(name: "Longueur", rating: .five, min: "Courte", max: "Longue"),
          Caracteristic(name: "Courage", rating: .five, min: "Peureux", max: "Courageux")
      ]
  ),
  Stallion(
      name: "Potion", age: 3, image: "horse6", imageP: "horse6p",
      discipline: .CSO, descendent: [], ancestor: [], price: 1200,
      caracteristc: [
          Caracteristic(name: "Longueur", rating: .five, min: "Courte", max: "Longue"),
          Caracteristic(name: "Courage", rating: .five, min: "Peureux", max: "Courageux")
      ]
  )
]




