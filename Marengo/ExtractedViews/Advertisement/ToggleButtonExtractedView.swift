//
//  FilterButtonExtractedView.swift
//  Marengo
//
//  Created by Thibault on 06/06/2025.
//

import SwiftUI

struct ToggleButtonExtractedView: View {
    @Binding var isToggled: Bool
    let allHorses: [Stallion]
    
    private var favoriteCount: Int {
        allHorses.filter(\.isFavorite).count
    }
    
    private var totalCount: Int {
        allHorses.count
    }
    
    private var displayText: String {
        isToggled ? "Favoris (\(favoriteCount))" : "Tous (\(totalCount))"
    }
    
    var body: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                isToggled.toggle()
            }
        } label: {
            HStack(spacing: 6) {
                Image(systemName: isToggled ? "heart.fill" : "circle.grid.2x2")
                    .font(.system(size: 14, weight: .medium))
                Text(displayText)
                    .font(.system(size: 14, weight: .medium))
            }
            .foregroundStyle(isToggled ? .white : .primary)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                isToggled ? .red : .gray.opacity(0.1),
                in: .rect(cornerRadius: 20)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isToggled ? .clear : .gray.opacity(0.3), lineWidth: 1)
            )
        }
    }
}

#Preview {
    @Previewable
    @State var isToggled = false
    let sampleHorses: [Stallion] = stallions
    
    VStack(spacing: 20) {
        ToggleButtonExtractedView(
            isToggled: .constant(true),
            allHorses: sampleHorses
        )
    }
}
