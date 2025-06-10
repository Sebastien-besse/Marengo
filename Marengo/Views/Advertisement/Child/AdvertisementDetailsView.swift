import SwiftUI

struct AdvertisementDetailsView: View {
    let stallion: Stallion

    @State private var showingContactAlert = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                ImageWithOverlayExtractedView(stallion: stallion)
                    
                    VStack(spacing: 24) {
                        // Informations principales
                        HStack {
                            Text("\(stallion.age) ans")
                                .font(.headline)
                                .foregroundStyle(.primary)
                            
                            Spacer()
                            
                            Text("Haras du Henno 59250")
                                .font(.headline)
                                .foregroundStyle(.primary)
                        }
                        .padding(.top, 20)
                        
                        // Description avec fond
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Patchino est un joli étalon de \(stallion.age) ans avec d'excellentes aptitudes pour le saut d'obstacles. Il présente un potentiel remarquable et une grande docilité qui en font un partenaire idéal pour la compétition.")
                                .font(.body)
                                .foregroundStyle(.primary)
                                .padding(16)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color(.systemGray6))
                                )
                        }
                        
                        CaracteristicsSlidersextractedView()
                        
                        PerformancesExtractedView()
                        
                        ProductionExtractedView()
                        
                        ContactButtonExtractedView()
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    
                    CloseViewButtonExtractedView()
                }
            }
        }
        .alert("Contact Vendeur", isPresented: $showingContactAlert) {
            Button("Appeler") {
            }
            Button("Annuler", role: .cancel) { }
        } message: {
            Text("Téléphone : 06 12 34 56 78")
        }
    }
}

#Preview {
    AdvertisementDetailsView(stallion: stallions[0])
}
