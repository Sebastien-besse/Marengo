//
//  Untitled.swift
//  Marengo
//
//  Created by YacineBahaka  on 06/06/2025.
//

import SwiftUI

struct HorseCardList: View {
    @State var stallions: [Stallion]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16)
                ], spacing: 20) {
//                    ForEach(stallions) { stallion in
//                        HorseCardExtractedView(
//                            stallion: $stallions[index],
//                            onFavoriteToggle: { updatedHorse in
//                                stallions[index] = updatedHorse
//                            }
//                        )
//                        .onTapGesture {
//                            print("Carte sélectionnée: \(stallion.name)")
//                        }
//                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
            }
            .navigationTitle("Juments")
            .navigationBarTitleDisplayMode(.large)
            .background(Color(.systemGroupedBackground))
        }
    }
}


#Preview{
    HorseCardList(stallions: stallions)
}
