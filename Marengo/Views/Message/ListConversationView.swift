//
//  ListConversationView.swift
//  Marengo
//
//  Created by Emma on 02/06/2025.
//

import SwiftUI

struct ListConversationView: View {
    @State var contact: [Conversation]
    var body: some View {
        ZStack{
            Color.backgroundApp
                .ignoresSafeArea()
            NavigationStack{
                
                ScrollView{
                    VStack{
                        ForEach (contact) { conversation in
                            NavigationLink(destination: MessageView(conversation: conversation), label: {
                                OneContactExtractedView(conversation: conversation)
                            })
                            
                        }
                        .padding(EdgeInsets(top: 5, leading: 1, bottom: 4, trailing: 1))
                        
                        
                        
                        
                    }
                }
                .background(.backgroundApp)
                .navigationTitle("Messages")
                
            }
            .padding()
            
        }
    }
}

#Preview {
    ListConversationView(contact: listConversation)
}
