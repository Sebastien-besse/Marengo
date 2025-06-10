//
//  PerformancesExtractedView.swift
//  Marengo
//
//  Created by Thibault on 10/06/2025.
//

import SwiftUI

struct PerformancesExtractedView: View {
    
    // Données des performances (trophées)
    private let performances = [
        Performance(position: 1, competition: "Grand Prix de Paris"),
        Performance(position: 2, competition: "CSI Lyon"),
        Performance(position: 3, competition: "Masters Cannes"),
        Performance(position: 1, competition: "Open de Deauville")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Performances")
                .font(.title3)
                .fontWeight(.semibold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(performances, id: \.id) { performance in
                        PerformanceCard(performance: performance)
                    }
                }
                .padding(4)
            }
        }
    }
}

// MARK: - Modèles de données

struct Performance: Identifiable {
    let id = UUID()
    let position: Int
    let competition: String
}

struct PerformanceCard: View {
    let performance: Performance
    
    private var positionText: String {
        switch performance.position {
        case 1: return "1er"
        case 2: return "2ème"
        case 3: return "3ème"
        default: return "\(performance.position)ème"
        }
    }
    
    private var trophyColor: Color {
        switch performance.position {
        case 1: return .yellow
        case 2: return .gray
        case 3: return .orange
        default: return .blue
        }
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "trophy.fill")
                .font(.title)
                .foregroundStyle(trophyColor)
            
            Text(positionText)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            
            Text(performance.competition)
                .font(.caption2)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .frame(width: 100, height: 120)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
        )
    }
}
