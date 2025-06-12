//
//  Profil.swift
//  Marengo
//
//  Created by Sebastien Besse on 01/06/2025.
//

import Foundation

@Observable
class Profile: Identifiable {
    let id: UUID = UUID()
    var name: String
    var image: String
    var stallion: [Stallion]
    var mare: [Mare]
    
    init(name: String, image: String, stallion: [Stallion], mare: [Mare]) {
        self.name = name
        self.image = image
        self.stallion = stallion
        self.mare = mare
    }
}

//extension Profile{
//    static let profile = Profile(name: "Philipe", stallion: [
//        Stallion(name: "Petit Tonnerre", image: "horse2"),
//        Stallion(name: "Bernard", image: "horse3"),
//        Stallion(name: "Rodrigo", image: "horse4"),
//        Stallion(name: "Micheline", image: "horse6"),
//    ], mare: [
//        Mare(name: "Pupuce", image: "horse4"),
//        Mare(name: "Angel", image: "horse6"),
//        Mare(name: "Valerie", image: "horse2"),
//        Mare(name: "Micheline", image: "horse3"),
//    ], image: "person5")
//}

