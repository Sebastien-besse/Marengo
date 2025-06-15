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
    @State var image: String = "horse1"
    @State var imageP: String = "horse1p"
    @State var descipline: Discipline = .CCE
    @State var caracteristics: [Caracteristic] = []
    @State var foal: Foal = .init(caracteristic: [], discipline: .CCE)
    @State var ratingHorse: RatingCaracteristic = .zero
    @State var isSave: Bool = false
    
    @Binding var addMare: AddHorseViewModel
    @State var isPresented: Bool = false
    
    var body: some View {
        
        ZStack{
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
                    
                    ForEach(carateristicPossible) { caracteristic in
                        CursorHorseExtratedView(title: caracteristic.name, nameValueMin: caracteristic.min, nameValueMax: caracteristic.max, caracteristics: $caracteristics)
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .scrollIndicators(.hidden)
            .padding()
            VStack{
                Spacer()
                Button {
                    print("here 1 \(addMare.profile.mare)")
                    addMare.addMare(name: name, age: UInt8(age) ?? 0, image: image, imageP: imageP, discipline: descipline, caracteristc: caracteristics, foal: foal)
                    isSave.toggle()
                } label: {
                    Text("Enregistrer")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
            }
        }
        .onChange(of: isPresented) {
            if isPresented {
                dismiss()
            }
        }
        .popover(isPresented: $isSave) {
            SheetValidationHorse(isPresented: $isPresented)
                .presentationDetents([.height(150)])
                
        }
        
    }
    
}

#Preview {
    AddMareView(ratingHorse: .five, addMare: .constant(AddHorseViewModel()))
}
