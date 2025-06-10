//
//  ImageWithOverlayExtractedView.swift
//  Marengo
//
//  Created by Thibault on 10/06/2025.
//
import SwiftUI

struct ImageWithOverlayExtractedView: View {
    var stallion: Stallion
    
    var body: some View {
                    ZStack {
                        Image(stallion.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipped()
                            .clipShape(.rect(cornerRadius: 13))
                        
                        // Overlay avec gradient
                        LinearGradient(
                            colors: [.clear, .black.opacity(0.7)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .clipShape(.rect(cornerRadius: 13))
                        
                        // Informations en overlay
                        VStack {
                            Spacer()
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(stallion.name)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                }
                                
                                Spacer()
                                
                                Text("\(stallion.price) €")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                        }
                    }
                    .padding(.horizontal)
                    
                }
            }
