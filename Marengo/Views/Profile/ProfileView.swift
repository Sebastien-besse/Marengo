//
//  ProfilView.swift
//  Marengo
//
//  Created by Sebastien Besse on 01/06/2025.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isAddHorse: Bool = false
    @State var isMare: Bool = false
    @State var isStallion: Bool = false
    @State var profile = AddHorseViewModel()
    
    var body: some View {
        VStack{
            Image(profile.profile.image)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
            
            Text(profile.profile.name)
                .font(.system(size: 22))
                .foregroundStyle(.brownText)
                .bold()
            HStack(spacing: 154){
                Text("Mes Chevaux")
                    .bold()
                    .font(.title)

                ButtonAddCircularExtractedView(systemImage: "plus", action: {}, showingModal: $isAddHorse)
                
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 50)
            MyHorseExtratedView(title: "Mes Etalon", profile: $profile)
                
            MyHorseExtratedView(title: "Mes Juments", profile: $profile)
        }
        .alert("Nouveau Cheval", isPresented: $isAddHorse, actions: {
            Button {
                isMare.toggle()
            } label: {
                Text("Jument")
            }
            Button {
                isStallion.toggle()
            } label: {
                Text("Etalon")
            }
            
        })
        .sheet(isPresented: $isMare, content: {
            AddMareView(addMare: $profile)
        })
        .sheet(isPresented: $isStallion, content:{ AddStallionView(addStallion: $profile)})
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ProfileView()
}
