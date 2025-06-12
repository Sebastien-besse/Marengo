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
            ScrollView(.horizontal){
                HStack{
                    getHorseType()
                }
            }
            .scrollIndicators(.hidden)
        }
    }
    
    @ViewBuilder
    func getHorseType() -> some View {
        if title.lowercased() == "mes juments"{
            ForEach(profile.profile.mare) { mare in
                CardHorse(imageHorse: mare.imageP, nameHorse: mare.name)
            }
        }else{
            ForEach(profile.profile.stallion) { stallion in
                CardHorse(imageHorse: stallion.imageP, nameHorse: stallion.name)
            }
       
        }
    }
}

#Preview {
    MyHorseExtratedView(title: "Etalon", profile: .constant(AddHorseViewModel()))
}



