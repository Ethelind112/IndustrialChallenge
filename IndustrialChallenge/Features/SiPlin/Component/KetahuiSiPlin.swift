//
//  KetahuiSiPlin.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 23/07/25.
//

import SwiftUI

struct KetahuiSiPlin: View {
    var body: some View {
        Button {
            
        }label: {
            HStack {
                Image(systemName: "play.circle.fill")
                    .font(.title2)
                    .padding(.trailing, 10)
                
                Text("Cek cara pakai SiPlin disini")
                    .font(.caption)
                    .fontWeight(.medium)
            }
            .foregroundColor(.primaryGreen)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(
            RadialGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(0.5),
                    Color.additionalColorGreen.opacity(0.5)
                ]),
                center: UnitPoint(x: -0.0324, y: 1.1125),
                startRadius: 0,
                endRadius: 200
            )
            .clipShape(RoundedRectangle(cornerRadius: 3.5))
        )
        .cornerRadius(3.5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(.primaryGreen, lineWidth: 0.44)
        )
    }
}

#Preview {
    KetahuiSiPlin()
}
