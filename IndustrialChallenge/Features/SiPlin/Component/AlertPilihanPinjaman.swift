//
//  AlertPilihanPinjaman.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 24/07/25.
//

import SwiftUI

struct AlertPilihanPinjaman: View {
    var body: some View {
        VStack {
            Text("⚠️ Kamu perlu menyadari bahwa jumlah pinjaman ini belum sesuai dengan kondisi keuanganmu saat ini.")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
            
            Text("Kamu mungkin perlu menambah penghasilan, mengurangi pengeluaran, atau memilih tenor yang lebih panjang.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(.top, 5)
            
        }
        .font(.caption)
        .padding(15)
        .background(.secondaryLightestYellow)
    }
}

#Preview {
    AlertPilihanPinjaman()
}
