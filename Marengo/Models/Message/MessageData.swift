//
//  Data message.swift
//  Marengo
//
//  Created by Emma on 02/06/2025.
//

import Foundation



var conversationAmandine: Conversation = Conversation(listMessages: [
    Message(text: "Est-ce qu'il a déjà eu des problèmes de santé ? Une boiterie à un membre ou autre ?", hour: Date.now, isSender: true, isRead: true),
    Message(text: "Il n'a jamais eu de problème au niveau des membres ! Il a déjà fait une colique une fois, mais c'était il y a des années", hour: Date.now, isSender: false, isRead: false)], person: profiles[0])

var conversationPhilippe: Conversation = Conversation(listMessages: [
    Message(text: "Bonjour ! Est-ce que vous avez possibilité de déplacer votre étalon ou est-ce que je dois ramener ma jument ?", hour: Date.now, isSender: false, isRead: true),
    Message(text: "Bonjour, tout dépend d'où ! Votre jument se trouve dans quelle ville ?", hour: Date.now, isSender: true, isRead: false),
    Message(text: "Je suis sur Pignon sur Marne", hour: Date.now, isSender: false, isRead: true)
], person: profiles[1])

var conversationJuliette: Conversation = Conversation(listMessages: [
    Message(text: "ça y est, le poulain est né", hour: Date(), isSender: false, isRead: true),
    Message(text: "Oh ! C'est super ! Il se porte bien ?", hour: Date(), isSender: true, isRead: true),
    Message(text: "Oui, il est en pleine forme🥳", hour: Date(), isSender: false, isRead: false),
    Message(text: "Vous voulez une photo ?", hour: Date(), isSender: false, isRead: false)
], person: profiles[2])

var listConversation: [Conversation] = [conversationAmandine, conversationPhilippe, conversationJuliette]

