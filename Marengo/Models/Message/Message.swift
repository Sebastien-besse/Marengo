//
//  Message.swift
//  Marengo
//
//  Created by Emma on 02/06/2025.
//

import Foundation


struct Message: Identifiable {
    let id: UUID = UUID()
    var text: String
    let hour: Date
    let isSender: Bool
    var isRead: Bool
    
}
