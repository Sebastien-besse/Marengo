//
//  ContactButtonExtractedView.swift
//  Marengo
//
//  Created by Thibault on 10/06/2025.
//

import SwiftUI

struct ContactButtonExtractedView: View {
    @State var showingContactAlert: Bool = false
    
    var body: some View {
        // Bouton de contact
        Button(action: {
            showingContactAlert = true
        }) {
            Text("Contacter le vendeur")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.accent)
                .clipShape(.rect(cornerRadius: 12))
        }
        .padding(.bottom, 30)
    }
}
