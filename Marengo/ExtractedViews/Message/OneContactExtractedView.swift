//
//  OneContactExtractedView.swift
//  Marengo
//
//  Created by Emma on 02/06/2025.
//

import SwiftUI

struct OneContactExtractedView: View {
    @ObservedObject var conversation: Conversation
    var body: some View {
        HStack {
            Image(conversation.person.image)
                .resizable()
                .scaledToFit()
                .clipShape(.circle)
                .frame(width:
                        90, height: 90)
                
                
            
            VStack(alignment: .leading){
                HStack{
                    
                    Text(conversation.person.name)
                        .bold()
                    
                    Spacer()
                    
                    HStack{
                        if conversation.nbNotif != 0 {
                            Circle()
                                .foregroundStyle(.accent)
                                .overlay(
                                    Text(conversation.nbNotif.description)
                                        .font(.caption))
                                .frame(width: 20)
                        }
                        Text(conversation.listMessages.last?.hour ?? Date.now, format: .dateTime.hour().minute())
                    }
                }
                .padding(.bottom, 4)
                Text(conversation.listMessages.last?.text ?? "")
                    .frame(height: 10)
                    
            }
        }
        .padding(8)
        .frame(height: 90)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .foregroundStyle(.brownText)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.brownStroke , lineWidth: 1)
        )
    }
}

#Preview {
    OneContactExtractedView(conversation: conversationAmandine)
}
