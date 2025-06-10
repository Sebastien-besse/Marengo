//
//  AddHorseView.swift
//  Marengo
//
//  Created by apprenant152 on 04/06/2025.
//

import SwiftUI

struct AddStallionView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Etalon")
                    .font(.title)
                    .bold()
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "trash")
                        .foregroundStyle(.brownText)
                        .font(.title3)
                        .bold()
                }

            }
            Spacer()
            Text("🐴")
                .font(.system(size: 100))
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

#Preview {
    AddStallionView()
}
