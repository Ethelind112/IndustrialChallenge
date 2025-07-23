//
//  HeaderExpense.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 23/07/25.
//

import SwiftUI

struct HeaderExpense: View {
    @Binding var currSiPlinStep: SiPlinStep
    
    var body: some View {
        ZStack (alignment: .leading) {
            VStack {
                Text("Isi Pengeluaranmu")
                    .font(.body)
                    .fontWeight(.bold)
                
                Text("SiPlin")
                    .font(.caption)
                    .foregroundColor(.gray)
//                                        .padding(.top, 0.5)
            }
            .frame(maxWidth: .infinity)
            
            Button {
                currSiPlinStep = .siPlinBorrowing
            }label: {
                Image(systemName: "arrow.left")
                    .foregroundColor(.primaryGreen)
            }
        }
    }
}
