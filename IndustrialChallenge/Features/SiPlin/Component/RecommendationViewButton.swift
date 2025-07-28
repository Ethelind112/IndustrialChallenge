//
//  RecommendationViewButton.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 23/07/25.
//

import SwiftUI

struct RecommendationViewButton: View {
    @State var textButton: String
    @State var textColor: Color
    @State var backgroundColor: Color
    @Binding var siPlinRecommendation: Bool
    
    var body: some View {
        Text(textButton)
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(textColor)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .background(backgroundColor)
            .cornerRadius(12)
    }
}

//#Preview {
//    RecommendationViewButton(textButton: "Gunakan Opsi", textColor: .primaryGreen, backgroundColor: .primaryLightGreen)
//}
