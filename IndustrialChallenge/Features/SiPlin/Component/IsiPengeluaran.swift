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
    @Binding var isError: Bool
    
    var body: some View {
        VStack (alignment: .leading) {
            
            
            Text("Pengeluaranmu per bulan berapa?")
                .fontWeight(.bold)
                .font(.callout)
                .foregroundColor(isError ? .red : .black)
            
            Text(computation)
                .font(.caption)
                .foregroundColor(.gray)
            
            HStack {
                Text("Rp")
                
                TextField("0", text: $viewModel.loanRequest.expense)
                    .disabled(true)
            }
            .font(.title3)
            .fontWeight(.bold)
            
            Rectangle()
                .frame(height: 1, alignment: .center)
                .foregroundColor(isError ? .red : .primaryGreen)
            
            if isError {
                Text("Pengeluaran tidak boleh minus")
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 24)
    }
}
