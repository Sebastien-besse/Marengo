//
//  ButtonAddCircularExtractedView.swift
//  AIDE
//
//  Created by DevTipsy94 on 26/03/2025.
//

import SwiftUI

struct ButtonAddCircularExtractedView: View {
    let systemImage: String
    let action: () -> Void
    @State private var showingModal = false
    
    var body: some View {
        Button {
            showingModal = true
        } label: {
            Circle()
                .frame(width: 40, height: 40)
                .foregroundColor(.accentColor)
                .overlay {
                    Image(systemName: systemImage)
                        .foregroundStyle(.white)
                        .bold()
                }
        }
        .sheet(isPresented: $showingModal) {
            AddAdvertisementModalView()
        }
    }
}

struct AddAdvertisementModalView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var horseName = ""
    @State private var horsePrice = ""
    @State private var selectedImage = ""
    
    let availableImages = ["horse1", "horse2", "horse3", "horse4", "horse5", "horse6", "horse7", "horse8"]
    
    var body: some View {
        NavigationView {
            Form {
                Section("Informations de l'étalon") {
                    TextField("Nom de l'étalon", text: $horseName)
                    
                    TextField("Prix", text: $horsePrice)
                        .keyboardType(.numberPad)
                }
                
                Section("Image") {
                    Picker("Sélectionner une image", selection: $selectedImage) {
                        ForEach(availableImages, id: \.self) { imageName in
                            HStack {
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                Text(imageName.capitalized)
                            }
                            .tag(imageName)
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            .navigationTitle("Nouvelle annonce")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Annuler") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Ajouter") {
                        // Ajouter l'action du bouton (append)
                        print("Nouvel étalon: \(horseName), Prix: \(horsePrice)")
                        dismiss()
                    }
                    .disabled(horseName.isEmpty || horsePrice.isEmpty)
                }
            }
        }
    }
}

#Preview("Circular Button") {
    ButtonAddCircularExtractedView(systemImage: "plus", action: { print("Bouton circulaire cliqué") })
}

#Preview("Modal") {
    AddAdvertisementModalView()
}
