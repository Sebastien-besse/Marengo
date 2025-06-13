//
//  CursorHorseExtratedView.swift
//  Marengo
//
//  Created by apprenant152 on 05/06/2025.
//

import SwiftUI

struct CursorHorseExtratedView: View {
    var title: String
    var nameValueMin: String
    var nameValueMax: String
    @State var ratingMare: RatingCaracteristic = .zero
    @Binding var caracteristics: [Caracteristic]
    var body: some View {
        VStack{
            Text(title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                Text(nameValueMin)
                Spacer()
                Text(nameValueMax)
            }
            .foregroundStyle(.gray)
            
            HStack(spacing: 35){
                ForEach(RatingCaracteristic.allCases, id: \.self.rawValue) { rating in
                    if rating != .zero {
                        Button {
                            ratingMare = rating
                            caracteristics.append(Caracteristic(name: title, rating: ratingMare, min: nameValueMin, max: nameValueMax))
                            print(caracteristics)
                  
                        } label: {
                            Text("\(rating.rawValue)")
                                .font(.title)
                                .foregroundStyle(.brownText)
                                .padding()
                                .background{
                                    Circle()
                                        .fill(ratingMare == rating ? .accent : .gray.opacity(0.2))
                                }
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    CursorHorseExtratedView(title: "Longueur", nameValueMin: "Court", nameValueMax: "Long", caracteristics: .constant([]))
}
