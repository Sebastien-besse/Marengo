//
//  SearchBarExtractedView.swift
//  AIDE
//
//  Created by Thibault on 27/05/2025.
//


import SwiftUI

struct SearchBarExtractedView: View {
    @Binding var searchText: String
    let onSearchTextChanged: (String) -> Void
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 12)
            
            TextField("Rechercher un étalon...", text: $searchText)
                .textFieldStyle(PlainTextFieldStyle())
                .onChange(of: searchText) {
                    onSearchTextChanged(searchText)
                }
            
            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                    onSearchTextChanged("")
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
                .fill(Color(.systemGray6))
        )
    }
}

#Preview {
    @Previewable @State var searchText = ""
    return SearchBarExtractedView(
        searchText: $searchText,
        onSearchTextChanged: { text in
            print("Recherche: \(text)")
        }
    )
    .padding()
}
