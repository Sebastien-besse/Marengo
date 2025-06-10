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
    @State var sliderValue: Double = 0
    let sliderLevel: [Int] = [0, 1, 2, 3, 4, 5]
    var body: some View {
        VStack{
            Text(title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 20){
                Text(nameValueMin)
                Slider(value: $sliderValue, in: 0.0...Double(sliderLevel.count - 1), step: 1)
                Text(nameValueMax)
            }
            .foregroundStyle(.gray)
            HStack(spacing: 35){
                ForEach(0...sliderLevel.count - 1, id: \.self){ index in
                    Text("\(self.sliderLevel[index])")
                }
              }
            }
        .padding()
        }
    }

#Preview {
    CursorHorseExtratedView(title: "Longueur", nameValueMin: "Court", nameValueMax: "Long")
}
