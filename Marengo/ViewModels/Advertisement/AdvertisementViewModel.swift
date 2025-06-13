import SwiftUI

@Observable
class AdvertisementViewModel {
    var searchText = ""
    var horses: [Stallion] = []
    var allHorses: [Stallion] = []
    var isShowingFavorites = false
    var selectedStallion: Stallion?
    var showingStallionDetails = false
    
    // MARK: -
    func filterHorses() {
        var filteredHorses = allHorses
        
        // Filtrer par texte de recherche
        if !searchText.isEmpty {
            filteredHorses = filteredHorses.filter { horse in
                horse.name.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        if isShowingFavorites {
            filteredHorses = filteredHorses.filter(\.isFavorite)
        }
        
        horses = filteredHorses
    }
    
    // MARK: -
    func loadSampleData() {
        allHorses = stallions
        horses = allHorses
    }
    
    // MARK: -
    func updateDisplayedHorses() {
        filterHorses()
    }
    
    // MARK: -
    func toggleFavorite(for stallion: Stallion) {
        // Mise à jour dans allHorses
        if let allIndex = allHorses.firstIndex(where: { $0.id == stallion.id }) {
            allHorses[allIndex].isFavorite.toggle()
        }
        
        // Mise à jour de l'affichage
        updateDisplayedHorses()
    }
    
    // MARK: -
    func selectStallion(_ stallion: Stallion) {
        selectedStallion = stallion
        showingStallionDetails = true
    }
}
