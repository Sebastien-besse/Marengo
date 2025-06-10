//
//  MyHorseExtratedView.swift
//  Marengo
//
//  Created by Sebastien Besse on 01/06/2025.
//

import SwiftUI

struct MyHorseExtratedView: View {
    let profile = profiles[0]
    @State var title: String
    
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
            ForEach(profile.mare) { mare in
                CardHorse(imageHorse: mare.imageP, nameHorse: mare.name)
            }
        }else{
            ForEach(profile.stallion) { stallion in
                CardHorse(imageHorse: stallion.imageP, nameHorse: stallion.name)
            }
       
        }
    }
}

#Preview {
    MyHorseExtratedView(title: "Etalon")
}



