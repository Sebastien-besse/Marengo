//
//  AddHorseView.swift
//  Marengo
//
//  Created by apprenant152 on 04/06/2025.
//

import SwiftUI
import PhotosUI

struct AddStallionView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var name: String = ""
    @State var age: String = ""
    @State var image: String = "horse1"
    @State var imageP: String = "horse1p"
    @State var price: String = ""
    @State var city: String = ""
    
    @State private var imageUI: Image? = nil
    @State private var base64ImageString: String = "horse1p"
    @State private var photoItem: PhotosPickerItem? = nil
    @State private var isShowingPhotoPicker: Bool = false
    
    @State var descipline: Discipline = .CCE
    @State var caracteristics: [Caracteristic] = []
    @State var descendent: [Horse] = []
    @State var ancestor: [Horse] = []
    
    @Binding var addStallion: AddHorseViewModel
    @State var ratingHorse: RatingCaracteristic = .zero
    @State var isPresented: Bool = false
    @State var isSave: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("Nouvel Étalon")
                            .font(.title)
                            .foregroundStyle(.brownText)
                            .bold()
                        Spacer()
                        Button(action: { dismiss() }) {
                            Text("Annuler")
                                .foregroundStyle(.brownText)
                                .font(.title3)
                                .bold()
                        }
                    }
                    
                    VStack {
                        ButtonAddPicture(
                            isShowingPhotoPicker: $isShowingPhotoPicker,
                            photoItem: $photoItem,
                            image: $imageUI,
                            base64ImageString: $base64ImageString
                        )
                    }
                    .frame(height: 200)
                    .padding()
                    VStack{
                        HStack {
                            TextField("Nom", text: $name)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                }
                            
                            Spacer()
                            
                            TextField("Âge", text: $age)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                }
                                .keyboardType(.numberPad)
                        }
                        HStack {
                            TextField("Prix", text: $price)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                }
                            
                            Spacer()
                            
                            TextField("Ville", text: $city)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                }
                                .keyboardType(.numberPad)
                        }

                    }
                    .padding()
                    
                    HStack {
                        Text("Caractéristiques")
                            .font(.title2)
                            .foregroundStyle(.brownText)
                            .bold()
                            .padding()
                    }
                    
                    VStack(spacing: 30) {
                        ForEach(carateristicPossible) { caracteristic in
                            CursorHorseExtratedView(
                                title: caracteristic.name,
                                nameValueMin: caracteristic.min,
                                nameValueMax: caracteristic.max,
                                caracteristics: $caracteristics
                            )
                        }
                    }
                    .padding()
                }
            }
            .scrollIndicators(.hidden)
            
            VStack {
                Spacer()
                Button {
                    addStallion.addStallion(
                        name: name,
                        age: UInt8(age) ?? 0,
                        image: image,
                        imageP: imageP,
                        discipline: descipline,
                        descendant: descendent,
                        ancestor: ancestor,
                        price: Int(price) ?? 0,
                        caracteristc: caracteristics
                    )
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
        .padding()
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
    AddStallionView(addStallion: .constant(AddHorseViewModel()))
}
