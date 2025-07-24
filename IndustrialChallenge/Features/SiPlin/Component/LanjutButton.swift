//
//  LanjutButton.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 23/07/25.
//

import SwiftUI

struct LanjutButton: View {
    
    @State var textColor: Color
    @State var backgroundColor: Color
    
    var body: some View {
        
        Text("Lanjut")
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(textColor)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 24)
            .background(backgroundColor)
            .cornerRadius(12)
            .padding(.horizontal, 22)
    }
}

#Preview {
    LanjutButton(textColor: .white, backgroundColor: .primaryGreen)
}
