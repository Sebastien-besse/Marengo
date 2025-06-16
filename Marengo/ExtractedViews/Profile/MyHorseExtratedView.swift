//
//  MyHorseExtratedView.swift
//  Marengo
//
//  Created by Sebastien Besse on 01/06/2025.
//


import SwiftUI

struct MyHorseExtratedView: View {
    @State var title: String
    @Binding var profile: AddHorseViewModel
    @State private var advertissementVM = AdvertisementViewModel()
    
    var body: some View {
        VStack{
            Text(title)
                .font(.title2)
                .foregroundStyle(.brownText)
                .bold()
                .frame(maxWidth: .infinity,maxHeight: 50, alignment: .leading)
                .padding(.leading, 20)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    getHorseType()
                    Spacer()
                        .frame(width: 6)
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
        }
    }
    
    @ViewBuilder
    func getHorseType() -> some View {
        if title.lowercased() == "mes juments"{
            ForEach(profile.profile.mare) { mare in
                Button {
                    profile.selectMare(mare)
                } label: {
                    CardHorse(imageHorse: mare.imageP, nameHorse: mare.name)
                }

                
                Spacer()
                    .frame(width: 6)
            }
        }else{
            ForEach(profile.profile.stallion) { stallion in
                Button {
                    advertissementVM.selectStallion(stallion)
                } label: {
                    CardHorse(imageHorse: stallion.imageP, nameHorse: stallion.name)
                }
            
                Spacer()
                    .frame(width: 6)
            }
            .sheet(isPresented: $advertissementVM.showingStallionDetails) {
                if let stallion = advertissementVM.selectedStallion {
                    AdvertisementDetailsView(stallion: stallion)
                }
            }
            .sheet(isPresented: $profile.showingMareDetails) {
                if let mare = profile.selectedStallion {
                    MareDetailView(mare: mare)
                }
            }
        }
    }
}

#Preview {
    MyHorseExtratedView(title: "Mes Jumets", profile: .constant(AddHorseViewModel()))
}



