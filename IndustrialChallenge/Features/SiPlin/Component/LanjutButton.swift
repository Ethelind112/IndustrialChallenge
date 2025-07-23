//
//  LanjutButton.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 23/07/25.
//

import SwiftUI

struct LanjutButton: View {
    var body: some View {
        
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

#Preview {
    LanjutButton()
}
