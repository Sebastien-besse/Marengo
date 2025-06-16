import SwiftUI

struct AdvertisementView: View {
    @State private var viewModel = AdvertisementViewModel()
    @State private var isPresented: Bool = false
    @State var isStallion: Bool = false
    @State var profile = AddHorseViewModel()
    //@State var stallions = AdvertisementView()
    @FocusState private var isFocused: Bool
    var body: some View {
        
        ZStack{
            Color.backgroundApp.ignoresSafeArea()
            NavigationStack {
                VStack(spacing: 0) {
                    
                    
                    // MARK: - Barre de recherche
                    VStack {
                        SearchBarExtractedView(
                            searchText: $viewModel.searchText,
                            onSearchTextChanged: { _ in
                                viewModel.filterHorses()
                            }
                                
                        )
                        .focused($isFocused)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 10)
                    }
                    .background(Color.backgroundApp)
                    
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
                    .padding(16)
                    .background(Color.backgroundApp)
                    
                    VStack{
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
                            }
                        }
                    } .background(Color.backgroundApp)
                    
                   
                }
                
                    .onTapGesture {
                        
                        isFocused = false
                        
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
                .navigationTitle("Annonces")
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
