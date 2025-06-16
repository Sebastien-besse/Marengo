//
//  SearchBarEventExtractedView.swift
//  Marengo
//
//  Created by YacineBahaka  on 13/06/2025.
//

import SwiftUI


//
//  SearchBarExtractedView.swift
//  AIDE
//
//  Created by Thibault on 27/05/2025.
//


import SwiftUI

struct SearchBarEventExtractedView: View {
    @Binding var searchText: String
    
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 12)
            
            TextField("Rechercher un évènement...", text: $searchText)
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
        .padding(12)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(.brownStroke , lineWidth: 1)
        )
    }
}


