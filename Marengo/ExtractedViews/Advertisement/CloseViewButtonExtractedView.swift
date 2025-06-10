//
//  CloseViewButtonExtractedView.swift
//  Marengo
//
//  Created by Thibault on 10/06/2025.
//

import SwiftUI

struct CloseViewButtonExtractedView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
        }) {
            Image(systemName: "xmark.circle.fill")
                .font(.title2)
                .foregroundColor(.secondary)
        }
        .foregroundStyle(.secondary)
    }
}
