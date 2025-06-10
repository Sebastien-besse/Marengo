//
//  Conversation.swift
//  Marengo
//
//  Created by Emma on 02/06/2025.
//

import Foundation

class Conversation: Identifiable, ObservableObject{
    let id = UUID()
    @Published var listMessages: [Message]
    var person: Profile
    var nbNotif: UInt {
        var nb: UInt = 0
        for i in listMessages {
            if !i.isSender && !i.isRead{
                nb += 1
            }
        }
        return nb
    }
    
    init(listMessages: [Message], person: Profile) {
        self.listMessages = listMessages
        self.person = person
    }
    
    func addNewMessage(str: String){
        self.listMessages.append(Message(text: str, hour: Date.now, isSender: true, isRead: false))
    }
}
