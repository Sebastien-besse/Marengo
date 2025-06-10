//
//  Data message.swift
//  Marengo
//
//  Created by Emma on 02/06/2025.
//

import Foundation


var message1: Message = Message(text: "Est-ce qu'il a déjà eu des problèmes de santé ? Une boiterie à un membre ou autre ?", hour: Date.now, isSender: true, isRead: true)
var message2: Message = Message(text: "Il n'a jamais eu de problème au niveau des membres ! Il a déjà fait une colique une fois, mais c'était il y a des années", hour: Date.now, isSender: false, isRead: false)
var message3: Message = Message(text: "Bonjour ! Est-ce que vous avez possibilité de déplacer votre étalon ou est-ce que je dois ramener ma jument ?", hour: Date.now, isSender: false, isRead: true)
var message4: Message = Message(text: "Bonjour, tout dépend d'où ! Votre jument se trouve dans quelle ville ?", hour: Date.now, isSender: true, isRead: false)
var message5: Message = Message(text: "Je suis sur Pignon sur Marne", hour: Date.now, isSender: false, isRead: true)


var conversationAmandine: Conversation = Conversation(listMessages: [message1, message2], person: profiles[0])
var concersationPhilippe: Conversation = Conversation(listMessages: [message3, message4, message5], person: profiles[1])

var listConversation: [Conversation] = [conversationAmandine, concersationPhilippe]

