//
//  ProfilView.swift
//  Marengo
//
//  Created by Sebastien Besse on 01/06/2025.
//

import SwiftUI

struct ProfileView: View {
    var profile = profiles[0]
    @State var isAddHorse: Bool = false
    @State var isMare: Bool = false
    @State var isStallion: Bool = false
    var body: some View {
        VStack{
            Image(profile.image)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
            
            Text(profile.name)
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
            MyHorseExtratedView(title: "Mes Etalon")
                .padding(.bottom)
            MyHorseExtratedView(title: "Mes Juments")
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
            AddMareView()
        })
        .sheet(isPresented: $isStallion, content:{ AddStallionView()})
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

#Preview {
    ProfileView()
}
