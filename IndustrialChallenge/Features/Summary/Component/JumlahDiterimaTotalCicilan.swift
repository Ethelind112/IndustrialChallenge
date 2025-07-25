//
//  JumlahDiterimaTotalCicilan.swift
//  IndustrialChallenge
//
//  Created by Amanda on 23/07/25.
//


import SwiftUI

struct JumlahDiterimaTotalCicilan : View {
    var borrowingLoan : BorrowingLoan
    
    var body : some View {
        HStack {
            Spacer()
            VStack(spacing: 4) {
                Text("Jumlah Diterima")
                    .foregroundStyle(Color("Gray2"))
                    .font(.system(size: 12))
                Text("Rp \(formatToRupiahStyle(borrowingLoan.jumlahDiterima)),00")
                    .font(.system(size: 14))
            }
            Spacer()
            Divider().frame(width: 1, height: 36)
            Spacer()
            VStack(spacing: 4) {
                Text("Total Cicilan")
                    .foregroundStyle(Color("Gray2"))
                    .font(.system(size: 12))
                Text("Rp \(formatToRupiahStyle(borrowingLoan.totalCicilan)),00")
                    .font(.system(size: 14))
            }
            Spacer()
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .opacity(0.8)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color("AdditionalColorLightGray"), lineWidth: 1)
                )
        )
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}


#Preview {
    let loan = BorrowingLoan(
        tenor: 12,
        cicilanPerBulan: "1000000",
        totalCicilan: "12000000",
        jumlahDiterima: "11000000",
        bunga: "500000",
        biayaLayanan: "300000",
        PPn: "100000"
    )

    JumlahDiterimaTotalCicilan(borrowingLoan: loan)
}
