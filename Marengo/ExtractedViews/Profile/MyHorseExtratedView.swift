//
//  MyHorseExtratedView.swift
//  Marengo
//
//  Created by Sebastien Besse on 01/06/2025.
//

import SwiftUI

struct MyHorseExtratedView: View {
    @State var title: String
    @Binding var profile: AddHorseViewModel
    
    var body: some View {
        VStack{
            Text(title)
                .font(.title2)
                .foregroundStyle(.brownText)
                .bold()
                .frame(maxWidth: .infinity,maxHeight: 50, alignment: .leading)
                .padding(.leading, 20)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    getHorseType()
                    Spacer()
                        .frame(width: 6)
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
        }
    }
    
    @ViewBuilder
    func getHorseType() -> some View {
        if title.lowercased() == "mes juments"{
            ForEach(profile.profile.mare) { mare in
                CardHorse(imageHorse: mare.imageP, nameHorse: mare.name)
                Spacer()
                    .frame(width: 6)
            }
        }else{
            ForEach(profile.profile.stallion) { stallion in
                CardHorse(imageHorse: stallion.imageP, nameHorse: stallion.name)
                Spacer()
                    .frame(width: 6)
            }
            
        }
    }
}

#Preview {
    MyHorseExtratedView(title: "Mes Juments", profile: .constant(AddHorseViewModel()))
}



