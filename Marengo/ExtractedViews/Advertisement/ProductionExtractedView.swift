//
//  ProductionExtractedView.swift
//  Marengo
//
//  Created by Thibault on 10/06/2025.
//

import SwiftUI

public struct ProductionExtractedView: View {
    public var body: some View {
        
        let productionImages = ["horse2p", "horse3p", "horse4p"]
        
        VStack(alignment: .leading, spacing: 16) {
            Text("Production")
                .font(.title3)
                .fontWeight(.semibold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(productionImages, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 150)
                            .clipShape(.rect(cornerRadius: 12))
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
}
