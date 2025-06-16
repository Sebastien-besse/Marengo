//
//  MareDetailView.swift
//  Marengo-app
//
//  Created by Sebastien Besse on 15/06/2025.
//

import SwiftUI

struct MareDetailView: View {
    let mare: Mare
    let profile = AddHorseViewModel()

    @State private var showingContactAlert = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ImageDetailMareExtractedView(mare: mare)
                    
                    VStack(spacing: 24) {
                        // Informations principales
                        HStack {
                            Text("\(mare.age) ans")
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
                            Text("\(mare.name) est une joli jument de \(mare.age) ans avec d'excellentes aptitudes pour le saut d'obstacles. Elle présente un potentiel remarquable et une grande docilité qui en font un partenaire idéal pour la compétition.")
                                .font(.body)
                                .foregroundStyle(.primary)
                                .padding(16)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color(.systemGray6))
                                )
                        }
                        
                        CaracteristicsSlidersextractedView()
                        
                        
                        ProductionExtractedView()
                        
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
    }

    }

#Preview {
    MareDetailView(mare: .init(name: "Jument", age: 4, image: "horse1", imageP: "horse1p", discipline: .CCE, foal: .init(caracteristic: caracteristics, discipline: .CCE), caracteristc: caracteristics))
}


