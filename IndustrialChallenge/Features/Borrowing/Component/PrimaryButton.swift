//
//  PrimaryButton.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//

import SwiftUI

struct PrimaryButton: View {
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text("Konfirmasi")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 22)
                .background(Color("PrimaryGreen"))
                .cornerRadius(8)
                .padding(.horizontal, 22)
        }
    }
}
