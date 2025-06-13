//
//  CaracteristicData.swift
//  Marengo
//
//  Created by YacineBahaka  on 04/06/2025.
//

var caracteristics: [Caracteristic] = [
    Caracteristic(name: "Ossature", rating: .five, min: "Légère", max: "Lourde")
]

let carateristicPossible : [Caracteristic] = [
    Caracteristic(name: "Ossature", rating: .zero, min: "Légère", max: "Lourde"),
    Caracteristic(name: "Taille", rating: .zero, min: "Petit", max: "Grand"),
    Caracteristic(name: "Technique de saut", rating: .zero, min: "Mauvaise", max: "Bonne"),
    Caracteristic(name: "Vitesse", rating: .zero, min: "Lent", max: "Rapide"),
    Caracteristic(name: "Courage", rating: .zero, min: "Peureux", max: "Courageux"),
    Caracteristic(name: "Respect", rating: .zero, min: "Négligent", max: "Respectueux")
]
