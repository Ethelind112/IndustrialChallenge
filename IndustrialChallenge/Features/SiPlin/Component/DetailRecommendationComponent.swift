//
//  DetailRecommendationComponent.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 23/07/25.
//

import SwiftUI

struct DetailRecommendationComponent: View {
    var backgroundColor: Color
    var borderColor: Color
    var sectionTitle: String
    var optionalText: String
    var recommended: String
    
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(sectionTitle)
                
                if optionalText != "" {
                    Text(optionalText)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            
            Text("Rp") + Text(recommended)
                .bold()
        }
        .font(.caption)
        .padding(17)
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(borderColor, lineWidth: 1)
        )
    }
}

#Preview {
    DetailRecommendationComponent(backgroundColor: .primaryLightGreen, borderColor: .additionalColorLightGray, sectionTitle: "Rekomendasi Pinjaman Tertinggi", optionalText: "test", recommended: "9.000.000")
}
