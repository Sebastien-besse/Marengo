import SwiftUI

struct AdvertisementView: View {
    @State private var viewModel = AdvertisementViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack(alignment: .center) {
                    Text("Annonces")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                    
                    Spacer()
                    
                    ButtonAddCircularExtractedView(
                        systemImage: "plus",
                        action: {
                            print("Bouton circulaire cliqué")
                        }
                    )
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 15)

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
                
                HStack {
                    FilterButtonExtractedView()
                    Spacer()
                    ToggleButtonExtractedView(
                        isToggled: $viewModel.isShowingFavorites,
                        allHorses: viewModel.allHorses
                    )
                }
                .padding(20)
                
                // Content
                if viewModel.horses.isEmpty {
                    ContentUnavailableView(
                        "Aucune annonce",
                        systemImage: "horse",
                        description: Text(viewModel.searchText.isEmpty ?
                                        "Aucune annonce disponible" :
                                        "Aucun résultat pour '\(viewModel.searchText)'\nEssayez de modifier votre recherche")
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        LazyVGrid(
                            columns: [
                                GridItem(.flexible(), spacing: 14),
                                GridItem(.flexible(), spacing: 14)
                            ],
                            spacing: 20
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
}

#Preview {
    AdvertisementView()
}
