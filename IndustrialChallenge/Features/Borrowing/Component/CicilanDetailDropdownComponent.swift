//
//  CicilanDetailDropdownComponent.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//
import SwiftUI

struct CicilanDetailDropdownComponent: View {
    @State private var isExpanded = false
    @Binding var showCicilanTooltipModal: Bool
    @Binding var borrowingLoan: BorrowingLoan
    @Binding var loanOption : LoanOption

    var body: some View {
        VStack(spacing: 0) {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                VStack(spacing: 16){
                    HStack {
                        HStack {
                            Text("Cicilan Perbulan")
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Button {
                                showCicilanTooltipModal = true
                            } label: {
                                Image(systemName: "info.circle")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color("ToolTipBlue"))
                            }
                        }
                        
                        Spacer()
                        Text("Rp \(formatToRupiahStyle(borrowingLoan.cicilanPerBulan ?? "-"))")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                            .foregroundColor(.black)
                    }
                    Text("Berlaku dari 10 Agustus hingga 10 Oktober")
                        .font(.caption2)
                        .fontWeight(.medium)
                        .foregroundColor(Color("DarkGreen"))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 4)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color("SecondaryGreen").opacity(0.6))
                        .cornerRadius(8)
                }
               
                .padding()
                .background(
                    RoundedCorner(radius: 16, corners: [.bottomLeft, .bottomRight])
                        .fill(Color.white)
                        .overlay(
                            RoundedCorner(radius: 16, corners: [.bottomLeft, .bottomRight])
                                .stroke(Color("AdditionalColorLightGray"), lineWidth: 1)
                        )
                )

            }

            if isExpanded {
                VStack(alignment: .leading, spacing: 12) {
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

                    HStack {
                        Text("Total Cicilan")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                        Spacer()
                        Text("Rp \(formatToRupiahStyle(borrowingLoan.totalCicilan))")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                    }
                }
                .padding()
                .background(
                    RoundedCorner(radius: 16, corners: [.bottomLeft, .bottomRight])
                        .fill(Color.white)
                        .overlay(
                            RoundedCorner(radius: 16, corners: [.bottomLeft, .bottomRight])
                                .stroke(Color("AdditionalColorLightGray"), lineWidth: 1)
                        )
                )
                
                .padding(.top, -8)

            }
        }
        .padding()

    }
}
