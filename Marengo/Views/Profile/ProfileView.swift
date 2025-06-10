//
//  ProfilView.swift
//  Marengo
//
//  Created by Sebastien Besse on 01/06/2025.
//

import SwiftUI

struct ProfileView: View {
    var profile = profiles[0]
    var body: some View {
        VStack{
            Image("person1")
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
                Button {
                    
                } label: {
                    Circle()
                        .frame(width: 40, height: 40)
                        .overlay {
                            Image(systemName: "plus")
                                .foregroundStyle(.brownText)
                                .bold()
                        }
                }

            }
            .frame(maxWidth: .infinity)
            .padding(.top, 50)
            MyHorseExtratedView(title: "Mes Étalons")
            .padding(.bottom)
            MyHorseExtratedView(title: "Mes Juments")
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

#Preview {
    ProfileView()
}
