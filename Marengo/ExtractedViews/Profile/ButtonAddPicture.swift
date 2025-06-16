//
//  ButtonAddPicture.swift
//  Marengo-app
//
//  Created by Sebastien Besse on 15/06/2025.
//


import Foundation
import SwiftUI
import PhotosUI

struct ButtonAddPicture: View {
    @Binding var isShowingPhotoPicker: Bool
    @Binding var photoItem: PhotosPickerItem?
    @Binding var image: Image?
    @Binding var base64ImageString: String
    
    var body: some View {
        VStack {
            if let image = image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxHeight: 250)

                    .clipShape(RoundedRectangle(cornerRadius: 20))
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        .accent,
                            style: StrokeStyle(lineWidth: 4, dash: [20, 10])
                        )
                    .frame(maxHeight: 250)
                    .overlay {
                        PhotosPicker(selection: $photoItem, matching: .images) {
                            Image(systemName: "camera.circle.fill")
                                .resizable()
                                .foregroundStyle(.accent)
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }
                    }
                    
            }
        }
        .onChange(of: photoItem) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    image = Image(uiImage: uiImage)
                    base64ImageString = encodeImageToBase64(uiImage) ?? ""
                }
            }
        }
    }

    
    func encodeImageToBase64(_ image: UIImage) -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return nil }
        return imageData.base64EncodedString()
    }
}

#Preview {
    ButtonAddPicture(isShowingPhotoPicker: .constant(false), photoItem: .constant(nil), image: .constant(nil), base64ImageString: .constant(""))
}
