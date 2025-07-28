//
//  DetailExpense.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 23/07/25.
//

import SwiftUI

struct DetailExpense: View {
    
    @ObservedObject var viewModel: SiPlinController
    
    var body: some View {
        VStack {
            HStack {
                Text("Jumlah pinjaman yang diajukan")
                Spacer()
                Text("Rp \(viewModel.borrowed)")
            }
            .font(.caption)
            .padding(16)
            .background(Color("AdditionalColorLightGray"))
            .cornerRadius(13)
            
            HStack {
                Text("Pendapatan")
                Spacer()
                Text("Rp \(viewModel.income)")
            }
            .font(.caption)
            .padding(16)
            .background(Color("AdditionalColorLightGray"))
            .cornerRadius(13)
        }
    }
}
