//
//  FilterButtonExtractedView.swift
//  Marengo
//
//  Created by YacineBahaka  on 06/06/2025.
//

import SwiftUI

// Enum pour les options de filtre - plus maintenable
enum FilterOption: String, CaseIterable, Identifiable {
    case priceAscending = "Prix croissant"
    case priceDescending = "Prix décroissant"
    case nearestFirst = "Plus près de moi"
    case farthestFirst = "Plus loin de moi"
    
    var id: String { rawValue }
    
    var systemImage: String {
        switch self {
        case .priceAscending: return "arrow.up.circle"
        case .priceDescending: return "arrow.down.circle"
        case .nearestFirst: return "location.circle"
        case .farthestFirst: return "location.circle.fill"
        }
    }
}

struct FilterButtonExtractedView: View {
    // MARK: - Properties
    @Binding var selectedFilter: FilterOption?
    let onFilterSelected: (FilterOption?) -> Void
    
    @State private var isPressed = false
    @State private var showingFilterOptions = false
    
    // MARK: - Computed Properties
    private var isFilterActive: Bool {
        selectedFilter != nil
    }
    
    private var buttonText: String {
        selectedFilter?.rawValue ?? "Filtrer"
    }
    
    // MARK: - Body
    var body: some View {
        Button {
            showingFilterOptions = true
        } label: {
            HStack(spacing: 6) {
                Image(systemName: isFilterActive ? "line.horizontal.3.decrease.circle.fill" : "line.horizontal.3.decrease.circle")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(isFilterActive ? .blue : .primary)
                
                Text(buttonText)
                    .font(.system(size: 14, weight: .medium))
                    .lineLimit(1)
            }
            .foregroundStyle(isFilterActive ? .blue : .primary)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(isFilterActive ? .blue.opacity(0.1) : .gray.opacity(0.1))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isFilterActive ? .blue.opacity(0.3) : .gray.opacity(0.3), lineWidth: 1)
            )
        }
        .buttonStyle(ScaleButtonStyle()) // Style moderne pour les animations
        .confirmationDialog(
            "Filtrer par",
            isPresented: $showingFilterOptions,
            titleVisibility: .visible
        ) {
            // Boutons de filtre
            ForEach(FilterOption.allCases) { option in
                Button {
                    handleFilterSelection(option)
                } label: {
                    Label(option.rawValue, systemImage: option.systemImage)
                }
            }
            
            // Bouton pour supprimer le filtre
            if isFilterActive {
                Button("Supprimer le filtre", role: .destructive) {
                    handleFilterSelection(nil)
                }
            }
            
            // Bouton annuler
            Button("Annuler", role: .cancel) { }
        }
        .accessibilityLabel(isFilterActive ? "Filtre actif: \(buttonText)" : "Filtrer")
        .accessibilityHint("Touchez pour ouvrir les options de filtre")
    }
    
    // MARK: - Methods
    private func handleFilterSelection(_ option: FilterOption?) {
        withAnimation(.easeInOut(duration: 0.3)) {
            selectedFilter = option
        }
        onFilterSelected(option)
    }
}

// MARK: - Custom Button Style
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

// MARK: - Preview
#Preview {
    @Previewable @State var selectedFilter: FilterOption? = nil
    
    FilterButtonExtractedView(
        selectedFilter: $selectedFilter,
        onFilterSelected: { filter in
            print("Filtre sélectionné: \(filter?.rawValue ?? "Aucun")")
        }
    )
}
