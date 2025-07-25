//
//  RincianCicilan.swift
//  IndustrialChallenge
//
//  Created by Amanda on 24/07/25.
//

import SwiftUI

struct RincianCicilan : View{
    @Binding var showRincianCicilanTooltipModal : Bool
    var borrowingLoan : BorrowingLoan
    var loanOption : LoanOption
    var body : some View{
        VStack(alignment: .leading, spacing: 16){
            HStack{
                Text("Rincian Cicilan").font(.callout).fontWeight(.semibold)
                Spacer()
                Button {
                    showRincianCicilanTooltipModal = true
                } label: {
                    Image(systemName: "info.circle")
                        .font(.system(size: 12))
                        .foregroundColor(Color("ToolTipBlue"))
                }
                
            }
            VStack(spacing: 12){
                HStack {
                    Text("Durasi Tenor")
                        .font(.system(size: 14))
                    Spacer()
                    Text("\(borrowingLoan.tenor) bulan")
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                        .foregroundColor(Color("PrimaryGreen"))
                }
                
                HStack {
                    Text("Jumlah Diterima")
                        .font(.system(size: 14))
                    Spacer()
                    Text("Rp \(formatToRupiahStyle(borrowingLoan.jumlahDiterima))")
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                }

                HStack {
                    Text("Bunga (\(String(format: "%.2f", loanOption.bungaRate))% x \(borrowingLoan.tenor))")
                        .font(.system(size: 14))
                    Spacer()
                    Text("Rp \(formatToRupiahStyle((borrowingLoan.bunga)))")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                }

                HStack {
                    Text("Biaya Layanan (10%)")
                        .font(.system(size: 14))
                    Spacer()
                    Text("Rp \(formatToRupiahStyle(borrowingLoan.biayaLayanan))")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                }

                HStack {
                    Text("PPn (4.3%)")
                        .font(.system(size: 14))
                    Spacer()
                    Text("Rp \(formatToRupiahStyle(borrowingLoan.PPn))")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                }
                Divider()
                HStack{
                    Text("Total Cicilan")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                    Spacer()
                    Text("Rp \(formatToRupiahStyle(borrowingLoan.totalCicilan))")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                }.padding(.vertical, 8)
                    .padding(.horizontal,8)
                    .background(Color("SecondaryLightestYellow"))
            }
            
            
        }
        .padding(.vertical, 22)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color("AdditionalColorLightGray"), lineWidth: 1)
                )
        )
        .padding(.horizontal, 12)
        
        
      
        
    }
}
