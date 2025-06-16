//
//  ImageDetailMareExtractedView.swift
//  Marengo-app
//
//  Created by Sebastien Besse on 15/06/2025.
//

import SwiftUI

struct ImageDetailMareExtractedView: View {
    var mare: Mare
    var body: some View {
        ZStack {
            Image(mare.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
                .clipShape(.rect(cornerRadius: 13))
            
            // Overlay avec gradient
            LinearGradient(
                colors: [.clear, .black.opacity(0.7)],
                startPoint: .top,
                endPoint: .bottom
            )
            .clipShape(.rect(cornerRadius: 13))
            
            // Informations en overlay
            VStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(mare.name)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
        }
        .padding(.horizontal)
        
    }
}


#Preview {
    ImageDetailMareExtractedView(mare: Mare(name: "Jument", age: 4, image: "horse1", imageP: "horse1p", discipline: .CCE, foal: .init(caracteristic: caracteristics, discipline: .CCE), caracteristc: caracteristics))
}
