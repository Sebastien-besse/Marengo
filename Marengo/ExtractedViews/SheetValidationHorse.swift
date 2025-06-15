//
//  SheetValidationHorse.swift
//  Marengo
//
//  Created by apprenant152 on 13/06/2025.
//

import SwiftUI

struct SheetValidationHorse: View {
    @Environment(\.dismiss) var dismiss
    @Binding var isPresented: Bool
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            Text("Votre cheval a été validé")
                .font(.title2)
                .bold()
                .foregroundStyle(.brownText)
            Button {
                isPresented.toggle()
                dismiss()
            } label: {
                Text("Ok")
                    .font(.title3)
                    .foregroundStyle(.brownText)
                    .bold()
                    .padding()
            }
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.accent)
                    .frame(width: 100)
            }
        }
    }
}

#Preview {
    SheetValidationHorse(isPresented: .constant(false))
}
