//
//  Untitled.swift
//  Marengo
//
//  Created by YacineBahaka  on 06/06/2025.
//

import SwiftUI

struct CardHorse: View {
    let imageHorse: String
    let nameHorse: String
    
    var body: some View {
        Image(imageHorse)
            .resizable()
            .scaledToFill()
            .frame(width: 136, height: 153)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.black.opacity(0.3))
                
                Text(nameHorse)
                    .foregroundStyle(.orangeText)
                    .bold()
                    .padding(.top, 100)
                    .padding(.trailing, 40)
            }
    }
}

#Preview {
    CardHorse(imageHorse: "horse1", nameHorse: "poulain")
}
