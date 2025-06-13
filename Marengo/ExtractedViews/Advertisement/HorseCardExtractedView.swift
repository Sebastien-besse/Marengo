import SwiftUI

struct HorseCardExtractedView: View {
    @Binding var stallion: Stallion
    var onFavoriteToggle: ((Stallion) -> Void)?
    
    // État local pour l'animation uniquement
    @State private var isAnimating = false
    
    // MARK: - Design System Constants
    private enum CardDesign {
        static let aspectRatio: CGFloat = 185/220 // Maintient les proportions d'origine
        static let cornerRadius: CGFloat = 16
        static let shadowRadius: CGFloat = 8
        static let shadowOffset = CGSize(width: 0, height: 4)
        static let shadowOpacity: CGFloat = 0.1
        
        // Spacing interne
        static let internalPadding: CGFloat = 12
        static let textSpacing: CGFloat = 4
        
        // Tailles des éléments
        static let heartButtonSize: CGFloat = 32
        static let heartIconSize: CGFloat = 16
        static let percentagePadding = EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8)
        static let percentageCornerRadius: CGFloat = 12
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Image du cheval depuis les assets
                Image(stallion.imageP)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
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
                    HStack {
                        Spacer()
                        
                        Button {
                            // Animation locale pour le feedback immédiat
                            withAnimation(.bouncy(duration: 0.3)) {
                                isAnimating = true
                            }
                            
                            // callback
                            onFavoriteToggle?(stallion)
                            
                            // Reset de l'animation après un délai
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                isAnimating = false
                            }
                        } label: {
                            Image(systemName: stallion.isFavorite ? "heart.fill" : "heart")
                                .font(.system(size: CardDesign.heartIconSize, weight: .medium))
                                .foregroundStyle(stallion.isFavorite ? .red : .white)
                                .frame(width: CardDesign.heartButtonSize, height: CardDesign.heartButtonSize)
                                .background(.ultraThinMaterial, in: .circle)
                            
                                // Animation basée sur l'état réel + feedback local
                                .scaleEffect(stallion.isFavorite ? 1.1 : 1.0)
                                .scaleEffect(isAnimating ? 1.3 : 1.0)
                                .animation(.bouncy(duration: 0.3), value: stallion.isFavorite)
                                .animation(.bouncy(duration: 0.2), value: isAnimating)
                        }
                        // Évite les animations par défaut
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.top, CardDesign.internalPadding)
                    .padding(.horizontal, CardDesign.internalPadding)
                    
                    Spacer()
                    
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading, spacing: CardDesign.textSpacing) {
                            Text(stallion.name)
                                .font(.system(size: scaledFontSize(base: 18, for: geometry.size.width), weight: .bold))
                                .foregroundStyle(.white)
                                .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 1)
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                            
                            Text("\(stallion.price) €")
                                .font(.system(size: scaledFontSize(base: 16, for: geometry.size.width), weight: .bold))
                                .foregroundStyle(.white)
                                .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 1)
                        }
                        
                        Spacer()
                        
                        if let percentage = stallion.matchPercentage {
                            HStack(spacing: 4) {
                                Text("\(percentage)%")
                                    .font(.system(size: scaledFontSize(base: 12, for: geometry.size.width), weight: .bold))
                            }
                            .foregroundStyle(.white)
                            .padding(CardDesign.percentagePadding)
                            .background(percentageColor(for: percentage), in: .rect(cornerRadius: CardDesign.percentageCornerRadius))
                        }
                    }
                    .padding(.bottom, CardDesign.internalPadding)
                    .padding(.horizontal, CardDesign.internalPadding)
                }
            }
        }
        .aspectRatio(CardDesign.aspectRatio, contentMode: .fit)
        .clipShape(.rect(cornerRadius: CardDesign.cornerRadius))
        .shadow(
            color: .black.opacity(CardDesign.shadowOpacity),
            radius: CardDesign.shadowRadius,
            x: CardDesign.shadowOffset.width,
            y: CardDesign.shadowOffset.height
        )
    }
    
    // MARK: - Dynamic Typography Support
    /// Calcule une taille de police adaptative basée sur la largeur disponible
    /// Respecte les Guidelines Apple pour l'accessibilité
    private func scaledFontSize(base: CGFloat, for width: CGFloat) -> CGFloat {
        let referenceWidth: CGFloat = 185 // Largeur de référence d'origine
        let scaleFactor = width / referenceWidth
        return base * min(scaleFactor, 1.2)
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
        HStack(spacing: 16) {
            HorseCardExtractedView(
                stallion: $stallionsList[0],
                onFavoriteToggle: { stallion in
                    print("Ajouté/Supprimé des favoris")
                }
            )
            
            HorseCardExtractedView(
                stallion: $stallionsList[1],
                onFavoriteToggle: { stallion in
                    print("Ajouté/Supprimé des favoris")
                }
            )
        }
        .padding()
    }
}
