//
//  AddHorseViewModel.swift
//  Marengo
//
//  Created by apprenant152 on 12/06/2025.
//

import Foundation

@Observable
class AddHorseViewModel {
    
    
    var profile : Profile = Profile(name: "Bernard", image: "person1", stallion: [], mare: [
        Mare(name: "Pupuce", age: 8, image: "horse4", imageP: "horse1p", discipline: .Dressage, foal: foal1,
             caracteristc: [
                Caracteristic(name: "Ossature", rating: .five, min: "Légère", max: "Lourde"),
                Caracteristic(name: "Tempérament", rating: .five, min: "Calme", max: "Fougueux")
             ]),
        Mare(name: "Angel", age: 11, image: "horse5", imageP: "horse2p", discipline: .CSO, foal: foal2,
             caracteristc: [
                Caracteristic(name: "Élégance tête", rating: .five, min: "Massive", max: "Fine"),
                Caracteristic(name: "Courage", rating: .five, min: "Peureux", max: "Courageux")
             ]),
        Mare(name: "Valerie", age: 10, image: "horse6", imageP: "horse3p", discipline: .CourseGalop, foal: foal3,
             caracteristc: [
                Caracteristic(name: "Longueur", rating: .five, min: "Courte", max: "Longue"),
                Caracteristic(name: "Ossature", rating: .five, min: "Légère", max: "Lourde")
             ]),
        Mare(name: "Micheline", age: 5, image: "horse7", imageP: "horse5p", discipline: .CourseTrot, foal: foal4,
             caracteristc: [
                Caracteristic(name: "Tempérament", rating: .five, min: "Calme", max: "Fougueux"),
                Caracteristic(name: "Courage", rating: .five , min: "Peureux", max: "Courageux")
             ])
    ])
    

    func addMare(name: String, age: UInt8, image: String, imageP: String, discipline: Discipline, caracteristc: [Caracteristic], foal: Foal){
        let newHorse = Mare(name: name, age: age, image: image, imageP: imageP, discipline: discipline, foal: foal, caracteristc: caracteristc)
        profile.mare.append(newHorse)
    }
    
    func addStallion(name: String, age: UInt8, image: String, imageP: String, discipline: Discipline, descendant: [Horse], ancestor: [Horse], price: Int, caracteristc: [Caracteristic]){
        let newHorse = Stallion(name: name, age: age, image: image, imageP: imageP, discipline: discipline, descendent: descendant, ancestor: ancestor, price: price, caracteristc: caracteristc)
        profile.stallion.append(newHorse)
    }
   
}
