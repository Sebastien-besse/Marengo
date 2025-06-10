//
//  AddMareView.swift
//  Marengo
//
//  Created by apprenant152 on 04/06/2025.
//

import SwiftUI

struct AddMareView: View {
    @Environment(\.dismiss) private var dismiss
    @State var name: String = ""
    @State var age: String = ""
    
    var body: some View {
            ScrollView {
                VStack{
                HStack {
                    Text("Nouvelle Jument")
                        .font(.title)
                        .bold()
                    Spacer()
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Annuler")
                            .foregroundStyle(.brownText)
                            .font(.title3)
                            .bold()
                    }
                }
               RoundedRectangle(cornerRadius: 20)
                    .fill(.gray.opacity(0.4))
                    .frame(width: .infinity, height: 300)
                    .overlay {
                        Button {
                            
                        } label: {
                            Image(systemName: "photo.badge.plus.fill")
                                .resizable()
                                .foregroundStyle(.white)
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .onTapGesture {
                                    
                                }
                        }
                    }
                HStack{
                    TextField("Nom", text: $name)
                        .padding()
                        .background(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                          
                        })
                    Spacer()
                    TextField("Âge", text: $age)
                        .padding()
                        .background(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                        })
                        .keyboardType(.numberPad)
                }
                    HStack{
                        Text("Caractéristiques")
                                .bold()
                                .padding()
                        Image(systemName: "arrow.down")
                            .resizable()
                            .foregroundStyle(.accent)
                            .bold()
                            .frame(width: 20, height: 20)
                    }
                
                CursorHorseExtratedView(title: "Longueur", nameValueMin: "Court", nameValueMax: "Long")
                CursorHorseExtratedView(title: "Ossature", nameValueMin: "Légére", nameValueMax: "Lourde")
                CursorHorseExtratedView(title: "Taille", nameValueMin: "Petit", nameValueMax: "Grand")
                CursorHorseExtratedView(title: "Technique de saut", nameValueMin: "Rigide", nameValueMax: "Souple")
                    
                Text("Caratère")
                    .bold()
                    .padding()
                CursorHorseExtratedView(title: "Courage", nameValueMin: "Peureux", nameValueMax: "Courageux")
                CursorHorseExtratedView(title: "Respect", nameValueMin: "Calme", nameValueMax: "Fougueux")
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
            .scrollIndicators(.hidden)
            .padding()
            
    }
    
}

#Preview {
    AddMareView(name: "", age: "0")
}
