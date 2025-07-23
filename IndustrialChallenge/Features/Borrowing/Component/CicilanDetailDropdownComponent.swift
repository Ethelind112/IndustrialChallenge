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
    var jumlahPinjaman: Double
    var selectedLoanOption: LoanOption
    
    @State private var hasilHitung: BorrowingLoan?

    var body: some View {
        VStack(spacing: 0) {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
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
                    Text("Rp \(formatToRupiahStyle(hasilHitung?.cicilanPerBulan ?? "-"))")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.black)
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

            if isExpanded, let hitung = hasilHitung {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Durasi Tenor")
                            .font(.system(size: 14))
                        Spacer()
                        Text("\(hitung.tenor) bulan")
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                            .foregroundColor(Color("PrimaryGreen"))
                    }

                    HStack {
                        Text("Bunga (\(String(format: "%.2f", selectedLoanOption.bungaRate))% x \(hitung.tenor))")
                            .font(.system(size: 14))
                        Spacer()
                        Text("Rp \(formatToRupiahStyle((hitung.bunga)))")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                    }

                    HStack {
                        Text("Biaya Layanan (1%)")
                            .font(.system(size: 14))
                        Spacer()
                        Text("Rp \(formatToRupiahStyle(hitung.biayaLayanan))")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                    }

                    HStack {
                        Text("PPn (11%)")
                            .font(.system(size: 14))
                        Spacer()
                        Text("Rp \(formatToRupiahStyle(hitung.PPn))")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                    }

                    Divider()

                    HStack {
                        Text("Total Cicilan")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                        Spacer()
                        Text("Rp \(formatToRupiahStyle(hitung.totalCicilan))")
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
        .onAppear(){
            print("Menghitung jumlah pinjaman", jumlahPinjaman)
            hasilHitung = BorrowingController().hitungPinjaman(jumlahDiterima: jumlahPinjaman, option: selectedLoanOption)
        }
        .onChange(of: jumlahPinjaman) { newValue in
            print("Menghitung jumlah pinjaman", newValue)
            hasilHitung = BorrowingController().hitungPinjaman(jumlahDiterima: newValue, option: selectedLoanOption)
        }
        .onChange(of: selectedLoanOption) { newOption in
            print("Menghitung jumlah pinjaman", jumlahPinjaman)
            hasilHitung = BorrowingController().hitungPinjaman(jumlahDiterima: jumlahPinjaman, option: newOption)
        }

    }
}
