//
//  Untitled.swift
//  Marengo
//
//  Created by YacineBahaka  on 06/06/2025.
//


import SwiftUI

struct FilterButtonExtractedView: View {
    @State private var isPressed = false
    @State private var showingFilterOptions = false
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: {
            showingFilterOptions = true
        }) {
            HStack(spacing: 6) {
                Image(systemName: "line.horizontal.3.decrease.circle")
                    .font(.system(size: 16, weight: .medium))
                Text("Filtrer")
                    .font(.system(size: 16, weight: .medium))
            }
            .foregroundColor(.primary)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.systemGray6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.systemGray4), lineWidth: 0.5)
                    )
            )
        }
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = pressing
            }
        }, perform: {})
        .actionSheet(isPresented: $showingFilterOptions) {
            ActionSheet(
                title: Text("Filtrer par"),
                buttons: [
                    .default(Text("Prix croissant")) {
                        print("Filtrer par prix croissant")
                    },
                    .default(Text("Prix décroissant")) {
                        print("Filtrer par prix décroissant")
                    },
                    .default(Text("Nom A-Z")) {
                        print("Filtrer par nom A-Z")
                    },
                    .default(Text("Nom Z-A")) {
                        print("Filtrer par nom Z-A")
                    },
                    .cancel(Text("Annuler"))
                ]
            )
        }
    }
}

#Preview {
    HStack {
        FilterButtonExtractedView()
        
        // Simulation du bouton favori pour comparaison visuelle
        Button(action: {}) {
            HStack(spacing: 6) {
                Image(systemName: "heart")
                    .font(.system(size: 16, weight: .medium))
                Text("Favoris")
                    .font(.system(size: 16, weight: .medium))
            }
            .foregroundColor(.primary)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.systemGray6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.systemGray4), lineWidth: 0.5)
                    )
            )
        }
    }
    .padding()
}
