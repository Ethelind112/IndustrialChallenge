//
//  IsiPengeluaran.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 23/07/25.
//

import SwiftUI

struct IsiPengeluaran: View {
    @ObservedObject var viewModel: SiPlinController
    @Binding var computation: String
    
    var body: some View {
        VStack (alignment: .leading) {
            
            
            Text("Pengeluaranmu per bulan berapa?")
                .fontWeight(.bold)
                .font(.callout)
            
            Text(computation)
                .font(.caption)
                .foregroundColor(.gray)
            
            HStack {
                Text("Rp")
                
                TextField("Pengeluaran", text: $viewModel.loanRequest.expense)
                    .disabled(true)
            }
            .font(.title3)
            .fontWeight(.bold)
            
            Rectangle()
                .frame(height: 1, alignment: .center)
                .foregroundColor(.primaryGreen)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 24)
    }
}
