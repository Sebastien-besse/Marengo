//
//  EventDetailView.swift
//  Marengo
//
//  Created by Emma on 13/06/2025.
//

import SwiftUI
import MapKit

struct EventDetailView: View {
    
    @State private var isRegister: Bool = false
    var event:Event
    var body: some View {
        ZStack{
            Color.backgroundApp
                .ignoresSafeArea()
            
            ScrollView{
                VStack{
                    Image(event.image)
                        .resizable()
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.bottom)
                }
                
                VStack(spacing: 20){
                    HStack{
                        VStack(alignment: .leading, spacing: 16){
                            Text(event.name)
                                .bold()
                            
                            HStack{
                                HStack{
                                    Image(systemName: "calendar")
                                    Text(event.date, format: .dateTime.day().month().year())
                                }
                                Spacer()
                                HStack{
                                    Image(systemName: "mappin.and.ellipse")
                                    Text(event.city)
                                }
                            }
                            .font(.caption)
                        }
                        .padding(EdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 8))
                        
                        VStack{
                            Text("\(event.price, specifier: "%.2f") €")
                                .bold()
                            VStack(alignment: .leading){
                                Text("\(event.nbPlaces ?? 0) places")
                                Text("disponibles")
                            }
                            .font(.caption)
                        }
                        .padding()
                        .background(.accent)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    
                    Text(event.description)
                        .font(.callout)
                        .padding(.bottom)
                }
                .padding(10)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .overlay(RoundedRectangle(cornerRadius: 30).stroke(.brownStroke, lineWidth: 2))
                .padding(1)
                .foregroundStyle(.brownText)
                
                Map(bounds: MapCameraBounds(
                    
                    minimumDistance: 200
                )){
                    Marker(event.name, coordinate: CLLocationCoordinate2D(latitude: 43.300000, longitude: 6.415900))
                }
                    .frame(height: 210)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding(.vertical)
                
                Button(action: {
                    isRegister.toggle()
                }, label: {
                    Text(isRegister ? "Se désinscrire" : "S'inscrire")
                        .font(.headline)
                        .foregroundStyle(.brownText)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.accent)
                        .clipShape(.rect(cornerRadius: 20))
})
            }
            .padding()
        }
    }
}

#Preview {
    EventDetailView(event: events[0])
}
