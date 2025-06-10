//
//  CaracteristicsSlidersextractedView.swift
//  Marengo
//
//  Created by Thibault on 10/06/2025.
//

import SwiftUI

struct CaracteristicsSlidersextractedView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(spacing: 16) {
                CharacteristicSlider(title: "Longueur", value: 3)
                CharacteristicSlider(title: "Puissance", value: 4)
                CharacteristicSlider(title: "Souplesse", value: 3)
                CharacteristicSlider(title: "Tempérament", value: 4)
            }
        }
    }
}

struct CharacteristicSlider: View {
    let title: String
    let value: Int
    
    private let maxValue = 5
    private let segmentWidth: CGFloat = 40
    private let segmentSpacing: CGFloat = 4
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                Spacer()
            }
            
            HStack(spacing: 4) {
                Text("Court")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                // Barre de progression avec segments fixes
                HStack(spacing: segmentSpacing) {
                    ForEach(1...maxValue, id: \.self) { index in
                        Rectangle()
                            .fill(index <= value ? Color.accent : Color(.systemGray4))
                            .frame(width: segmentWidth, height: 6)
                            .clipShape(.rect(cornerRadius: 3))
                    }
                }
                
                Spacer()
                
                Text("Long")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
