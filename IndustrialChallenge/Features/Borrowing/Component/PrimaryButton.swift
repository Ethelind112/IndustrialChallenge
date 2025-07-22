//
//  PrimaryButton.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//

import SwiftUI

struct PrimaryButton: View {
    var body: some View {
        Button {
        } label: {
            Text("Konfirmasi")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 24)
                .background(Color("PrimaryGreen"))
                .cornerRadius(12)
                .padding(.horizontal, 22)
        }
    }
}
