//
//  SearchBarEventExtractedView.swift
//  Marengo
//
//  Created by YacineBahaka  on 13/06/2025.
//

import SwiftUI

struct SearchBarEventExtractedView: View {
    @Binding var searchText: String
    
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 12)
            
            TextField("Rechercher une ville...", text: $searchText)
                .textFieldStyle(PlainTextFieldStyle())
                
            
            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                }
            }
        }
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.white))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.gray).opacity(0.3), lineWidth: 1)
        )
    }
}
