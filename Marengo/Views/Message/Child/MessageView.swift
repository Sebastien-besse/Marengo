//
//  MessageView.swift
//  Marengo
//
//  Created by YacineBahaka  on 06/06/2025.
//

//
//  MessageView.swift
//  Marengo
//
//  Created by Emma on 04/06/2025.
//

import SwiftUI

struct MessageView: View {
    @State var newMessage: String = ""
    @ObservedObject var conversation: Conversation
    
    
    func showListMessages(_ listMessage: [Message]) -> some View {
        
        ForEach (listMessage){ message in
            if message.isSender{
                HStack{
                    Spacer()
                    
                    VStack(alignment:.trailing){
                        Text(message.text)
                            .padding(.bottom, 4)
                        Text(message.hour, format: .dateTime.hour().minute())
                            .font(.caption)
                    }
                    .padding()
                    .background(.orangeSecond)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .foregroundStyle(.brownText)
                    .overlay(alignment: .bottomTrailing){
                        
                        Image(systemName: "arrowtriangle.down.fill")
                            .font(.title)
                            .rotationEffect(.degrees(-45))
                            .offset(x:12, y: 12)
                            .foregroundStyle(.orangeSecond)
                    }
                    
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 12))
            }
            else{
                HStack{
                    VStack(alignment:.leading){
                        Text(message.text)
                            .padding(.bottom, 4)
                        Text(message.hour, format: .dateTime.hour().minute())
                            .font(.caption)
                    }
                    .padding()
                    .background(.brownBackgroundMessage)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .foregroundStyle(.orangeText)
                    .overlay(alignment: .bottomLeading){
                        
                        Image(systemName: "arrowtriangle.down.fill")
                            .font(.title)
                            .rotationEffect(.degrees(45))
                            .offset(x:-12, y: 12)
                            .foregroundStyle(.brownBackgroundMessage)
                    }
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 12, bottom: 15, trailing: 0))
            }
        }
        
    }
    
    
    var body: some View {
        ZStack{
            Color.backgroundApp
                .ignoresSafeArea()
            
            VStack(alignment:.leading){
                ScrollView{
                    showListMessages(conversation.listMessages)
                }
                
                HStack{
                    TextField("Ecrire ici", text: $newMessage)
                        .padding(12)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.brownStroke , lineWidth: 1)
                        )
                        
                    
                    Button(action:{
                        if !newMessage.isEmpty{
                            conversation.listMessages.append(Message(text: newMessage, hour: Date.now, isSender: true, isRead: false))
                            newMessage = ""
                        }
                    }, label:{
                        Image(systemName: "arrow.up.circle.fill")
                                                .resizable()
                                                .frame(width: 44, height: 44)
                                                .foregroundStyle(.brownText, .accent)
                    })
                    
                        
                }
            }
            .padding()
        }
    }
}

#Preview {
    MessageView(conversation: conversationAmandine)
}
