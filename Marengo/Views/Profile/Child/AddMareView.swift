//
//  AddMareView.swift
//  Marengo
//
//  Created by apprenant152 on 04/06/2025.
//

import SwiftUI
import PhotosUI

struct AddMareView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var name: String = ""
    @State var age: String = ""
    @State var image: String = "horse1"
    @State var imageP: String = "horse1p"
    
    @State private var imageUI: Image? = nil
    @State private var base64ImageString: String = "horse1p"
    @State private var photoItem: PhotosPickerItem? = nil
    @State private var isShowingPhotoPicker: Bool = false
    
    @State var descipline: Discipline = .CCE
    @State var caracteristics: [Caracteristic] = []
    @State var foal: Foal = .init(caracteristic: [], discipline: .CCE)
    @State var ratingHorse: RatingCaracteristic = .zero
    @State var isSave: Bool = false
    
    @Binding var addMare: AddHorseViewModel
    @State var isPresented: Bool = false
    @FocusState private var isFocusedName: Bool
    @FocusState private var isFocusedAge: Bool
    
    var body: some View {
        
        ZStack{
            Color.backgroundApp
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    VStack{
                        
                        
                        HStack {
                            Text("Nouvelle Jument")
                                .font(.title)
                                .foregroundStyle(.brownText)
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
                        VStack{
                            ButtonAddPicture(
                                isShowingPhotoPicker: $isShowingPhotoPicker,
                                photoItem: $photoItem,
                                image: $imageUI,
                                base64ImageString: $base64ImageString
                            )
                        }
                        .frame(height: 200)
                        .padding()
                        HStack {
                            TextField("Nom", text: $name)
                                .padding()
                                .focused($isFocusedName)
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.brownStroke.opacity(0.5), lineWidth: 1)
                                
                                }
                            
                            Spacer()
                            
                            TextField("Âge", text: $age)
                                .padding()
                                .focused($isFocusedAge)
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.brownStroke.opacity(0.5), lineWidth: 1)
                                
                                }
                                .keyboardType(.numberPad)
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
                        
                        
                    }

                    
                }
                .scrollIndicators(.hidden)
                .padding(.bottom,60)
            }
            .scrollIndicators(.hidden)
            .padding()
            

            VStack {
                Spacer()
                Button {
                    
                    addMare.addMare(
                        name: name,
                        age: UInt8(age) ?? 0,
                        image: image,
                        imageP: imageP,
                        discipline: descipline,
                        caracteristc: caracteristics,
                        foal: foal
                    )
                    isSave.toggle()
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
        .onTapGesture {
            
            isFocusedName = false
            isFocusedAge = false
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
    private var isFormComplete: Bool {
        return caracteristics.count >= carateristicPossible.count &&

               !name.isEmpty &&
               !age.isEmpty
    }
    


}

#Preview {
    AddMareView(ratingHorse: .five, addMare: .constant(AddHorseViewModel()))
}

