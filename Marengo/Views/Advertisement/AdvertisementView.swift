import SwiftUI

struct AdvertisementView: View {
    @State private var viewModel = AdvertisementViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // MARK: - Titre et bouton d'ajout d'étalon
                HStack(alignment: .center) {
                    Text("Annonces")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                    
                    Spacer()
                    
                    ButtonAddCircularExtractedView(
                        systemImage: "plus",
                        action: {
                            // Action du bouton
                        }
                    )
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 15)

                // MARK: - Barre de recherche
                VStack {
                    SearchBarExtractedView(
                        searchText: $viewModel.searchText,
                        onSearchTextChanged: { _ in
                            viewModel.filterHorses()
                        }
                    )
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                }
                
                // MARK: - Section filtre et toggle
                HStack {
                    FilterButtonExtractedView(
                        selectedFilter: $viewModel.selectedFilter,
                        onFilterSelected: { filter in
                            viewModel.applyFilter(filter)
                        }
                    )
                    
                    Spacer()
                    
                    ToggleButtonExtractedView(
                        isToggled: $viewModel.isShowingFavorites,
                        allHorses: viewModel.allHorses
                    )
                }
                .padding(20)
                
                // MARK: - Grille des étalons
                if viewModel.horses.isEmpty {
                    ContentUnavailableView(
                        "Aucune annonce",
                        systemImage: "horse",
                        description: Text(contentUnavailableDescription)
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        LazyVGrid(
                            columns: [
                                GridItem(.flexible(), spacing: 16),
                                GridItem(.flexible(), spacing: 16)
                            ],
                            spacing: 16
                        ) {
                            ForEach(viewModel.horses) { horse in
                                if let index = viewModel.allHorses.firstIndex(where: { $0.id == horse.id }) {
                                    HorseCardExtractedView(
                                        stallion: $viewModel.allHorses[index],
                                        onFavoriteToggle: { updatedHorse in
                                            viewModel.toggleFavorite(for: updatedHorse)
                                        }
                                    )
                                    .onTapGesture {
                                        viewModel.selectStallion(horse)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 8)
                        .padding(.bottom, 20)
                    }
                }
                
                Spacer()
            }
            .onAppear {
                viewModel.loadSampleData()
            }
            .onChange(of: viewModel.isShowingFavorites) { _, _ in
                viewModel.updateDisplayedHorses()
            }
            .sheet(isPresented: $viewModel.showingStallionDetails) {
                if let stallion = viewModel.selectedStallion {
                    AdvertisementDetailsView(stallion: stallion)
                }
            }
        }
    }
    
    // MARK: - Messages d'erreurs
    private var contentUnavailableDescription: String {
        if viewModel.isShowingFavorites && !viewModel.searchText.isEmpty {
            return "Aucun favori trouvé pour '\(viewModel.searchText)'"
        } else if viewModel.isShowingFavorites {
            return "Aucun favori ajouté"
        } else if !viewModel.searchText.isEmpty {
            return "Aucun résultat pour '\(viewModel.searchText)'\nEssayez de modifier votre recherche"
        } else {
            return "Aucune annonce disponible"
        }
    }
}

#Preview {
    AdvertisementView()
}
