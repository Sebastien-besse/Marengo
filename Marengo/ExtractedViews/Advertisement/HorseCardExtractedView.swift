import SwiftUI

struct HorseCardExtractedView: View {
    @Binding var stallion: Stallion
    var onFavoriteToggle: ((Stallion) -> Void)?
    
    var body: some View {
        ZStack {
            // Image du cheval depuis les assets
            Image(stallion.imageP)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 185, height: 220)
                .clipped()
            
            // Gradient overlay pour améliorer la lisibilité du texte
            LinearGradient(
                colors: [
                    .clear,
                    .black.opacity(0.3),
                    .black.opacity(0.6)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            
            // Overlays positionnés
            VStack {
                // Top overlay - Bouton favoris en haut à droite
                HStack {
                    Spacer()
                    
                    Button {
                        withAnimation(.bouncy(duration: 0.5)) {
                            stallion.isFavorite.toggle()
                            onFavoriteToggle?(stallion)
                        }
                    } label: {
                        Image(systemName: stallion.isFavorite ? "heart.fill" : "heart")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundStyle(stallion.isFavorite ? .red : .white)
                            .frame(width: 32, height: 32)
                            .background(.ultraThinMaterial, in: .circle)
                            .scaleEffect(stallion.isFavorite ? 1.1 : 1.0)
                    }
                }
                .padding(.top, 12)
                .padding(.horizontal, 12)
                
                Spacer()
                
                // Bottom overlay - Informations en bas
                HStack(alignment: .bottom) {
                    // Nom et prix en bas à gauche
                    VStack(alignment: .leading, spacing: 4) {
                        Text(stallion.name)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.white)
                            .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 1)
                        
                        Text("\(stallion.price) €")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.white)
                            .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 1)
                    }
                    
                    Spacer()
                    
                    // Match percentage en bas à droite
                    if let percentage = stallion.matchPercentage {
                        HStack(spacing: 4) {
                            Text("\(percentage)%")
                                .font(.system(size: 12, weight: .bold))
                        }
                        .foregroundStyle(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(percentageColor(for: percentage), in: .rect(cornerRadius: 12))
                    }
                }
                .padding(.bottom, 12)
                .padding(.horizontal, 12)
            }
        }
        .frame(width: 185, height: 220)
        .clipShape(.rect(cornerRadius: 16))
        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
    
    private func percentageColor(for percentage: Int) -> Color {
        switch percentage {
        case 90...100: return .green
        case 75...89: return .orange
        case 60...74: return .yellow.opacity(0.8)
        default: return .red.opacity(0.8)
        }
    }
}

#Preview {
    @Previewable @State var stallionsList = stallions
    
    VStack {
        HorseCardExtractedView(stallion: $stallionsList[3])
    }
}
