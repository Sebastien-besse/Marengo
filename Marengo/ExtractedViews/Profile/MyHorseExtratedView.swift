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
            UnderTitleView(title: $title)
                .frame(maxWidth: .infinity,maxHeight: 50, alignment: .leading)
            ScrollView(.horizontal){
                HStack{
                    ForEach(profile.stallion) { etalon in
                        CardHorse(imageHorse: etalon.image, nameHorse: etalon.name)
                    }
                }
                
            }
        }
    }
}

#Preview {
    MyHorseExtratedView(title: "Jument")
}

struct UnderTitleView: View {
    @Binding var title: String
    var body: some View {
        Text(title)
            .font(.title2)
            .foregroundStyle(.brownText)
            .bold()
    }
}
