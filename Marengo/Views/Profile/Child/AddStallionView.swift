//
//  AddHorseView.swift
//  Marengo
//
//  Created by apprenant152 on 04/06/2025.
//

import SwiftUI

struct AddStallionView: View {
    @Environment(\.dismiss) private var dismiss
    @State var name: String = ""
    @State var age: String = ""
    @State var image: String = "horse1"
    @State var imageP: String = "horse1p"
    @State var descipline: Discipline = .CCE
    @State var caracteristics: [Caracteristic] = []
    @State var descendent: [Horse] = []
    @State var ancestor: [Horse] = []
    @State var price: Int = 0
    @Binding var addStallion: AddHorseViewModel
    @State var ratingHorse: RatingCaracteristic = .zero
    var body: some View {
        ZStack{
            ScrollView {
                VStack{
                    HStack {
                        Text("Nouveau Etalon")
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
                        .frame(width: max(370, 0), height: max(300, 0))
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
                        addStallion.addStallion(name: name, age: UInt8(age) ?? 0, image: image, imageP: imageP, discipline: descipline, descendant: descendent, ancestor: ancestor, price: price, caracteristc: caracteristics)
                        dismiss()
                    } label: {
                        Text("Enregistrer")
                            .font(.headline)
                            .foregroundColor(isFormComplete ? .whiteOrange : .white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(isFormComplete ? Color.accent : Color.gray)
                            .cornerRadius(20)
                            .scaleEffect(isFormComplete ? 1.0 : 0.95)
                    }
                    .disabled(!isFormComplete)
                }
            }
        }
    
    private var isFormComplete: Bool {
        return caracteristics.count >= carateristicPossible.count &&
               !name.isEmpty &&
               !age.isEmpty
    }
}

#Preview {
    AddStallionView(addStallion: .constant(AddHorseViewModel()))
}
