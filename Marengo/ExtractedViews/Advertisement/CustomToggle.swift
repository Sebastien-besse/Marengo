//
//  CustomToggle.swift
//  ComponentsLibrary
//
//  Created by Thibault on 26/05/2025.
//

import SwiftUI

struct CustomToggle: View {
    @State private var toggleIsOn = false
    
    var body: some View {
        HStack(spacing: 8) {
            if toggleIsOn {
                Text("Favoris uniquement")
                Toggle("", isOn: $toggleIsOn)
                    .labelsHidden()
            } else {
                Text("Tous les résultats")
                Toggle("", isOn: $toggleIsOn)
                    .labelsHidden()
            }
        }
    }
}

#Preview {
    VStack(spacing: 0) {
        CustomToggle()
    }
    .padding()
}
