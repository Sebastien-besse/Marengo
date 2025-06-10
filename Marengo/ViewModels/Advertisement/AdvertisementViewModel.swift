//
//  AdvertisementViewModel.swift
//  Marengo
//

import SwiftUI
import Observation

@Observable
class AdvertisementViewModel {
    // MARK: - Properties
    var allHorses: [Stallion] = []
    var horses: [Stallion] = []
    var searchText: String = ""
    var isShowingFavorites: Bool = false
    var selectedFilter: FilterOption? = nil
    var showingStallionDetails = false
    var selectedStallion: Stallion?
    
    // MARK: - Initialization
    init() {
        loadSampleData()
    }
    
    // MARK: - Data Loading
    func loadSampleData() {
        allHorses = stallions
        updateDisplayedHorses()
    }
    
    // MARK: - Filtering & Searching
    func updateDisplayedHorses() {
        var result = allHorses
        
        // Filtrer par favoris si activé
        if isShowingFavorites {
            result = result.filter { $0.isFavorite }
        }
        
        // Filtrer par texte de recherche
        if !searchText.isEmpty {
            result = result.filter { horse in
                horse.name.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        // Appliquer le tri selon le filtre sélectionné
        if let filter = selectedFilter {
            result = applySorting(to: result, using: filter)
        }
        
        horses = result
    }
    
    private func applySorting(to horses: [Stallion], using filter: FilterOption) -> [Stallion] {
        switch filter {
        case .priceAscending:
            return horses.sorted { $0.price < $1.price }
        case .priceDescending:
            return horses.sorted { $0.price > $1.price }
        case .nearestFirst:
            // Implémentation basée sur la distance (exemple avec matchPercentage)
            return horses.sorted { ($0.matchPercentage ?? 0) > ($1.matchPercentage ?? 0) }
        case .farthestFirst:
            return horses.sorted { ($0.matchPercentage ?? 0) < ($1.matchPercentage ?? 0) }
        }
    }
    
    func filterHorses() {
        updateDisplayedHorses()
    }
    
    func applyFilter(_ filter: FilterOption?) {
        selectedFilter = filter
        updateDisplayedHorses()
    }
    
    // MARK: - Favorites Management
    func toggleFavorite(for horse: Stallion) {
        print("🎯 toggleFavorite appelé pour: \(horse.name)")
        print("📊 État avant: isFavorite = \(horse.isFavorite)")
        
        // ✅ Trouve l'index et met à jour une seule fois
        if let index = allHorses.firstIndex(where: { $0.id == horse.id }) {
            print("✅ Cheval trouvé à l'index \(index)")
            
            // ✅ Mutation atomique avec animation
            withAnimation(.easeInOut(duration: 0.2)) {
                allHorses[index].isFavorite.toggle()
            }
            
            print("🔄 Nouvel état: isFavorite = \(allHorses[index].isFavorite)")
            
            // ✅ Force la mise à jour de l'affichage
            updateDisplayedHorses()
            print("📱 updateDisplayedHorses() appelé")
            
            // ✅ Log pour debug du compteur de favoris
            let favoriteCount = allHorses.filter(\.isFavorite).count
            print("💖 Total favoris: \(favoriteCount)")
            
        } else {
            print("❌ Erreur: Cheval non trouvé dans allHorses")
        }
    }
    
    // MARK: - Selection
    func selectStallion(_ stallion: Stallion) {
        selectedStallion = stallion
        showingStallionDetails = true
    }
    
    // MARK: - Computed Properties
    var favoriteCount: Int {
        allHorses.filter(\.isFavorite).count
    }
    
    var displayedHorsesCount: Int {
        horses.count
    }
}
