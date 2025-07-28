//
//  JumlahPinjamanInputBox.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//

import SwiftUI

struct JumlahPinjamanInputBox: View {
    @Binding var showJumlahPinjamanTooltipModal: Bool
    @Binding var showCustomNumpad: Bool
    @Binding var input: String
    @Binding var showMaksimumLimitTooltip: Bool
    @Binding var alertSiPlin: Bool
    var maximumLimit = formatToRupiahStyle(maximumLimitPinjaman)
    var showToastCallback: (ToastType, String) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Text("Jumlah Pinjaman")
                    .font(.callout).fontWeight(.semibold)
                Button {
                    showJumlahPinjamanTooltipModal = true
                } label: {
                    Image(systemName: "info.circle")
                        .font(.system(size: 12))
                        .foregroundColor(Color("ToolTipBlue"))
                }
            }

            HStack {
                Text("Rp")
                    .font(.headline)
                    .foregroundColor(.black)
                Text(input.isEmpty ? "10.000.000" : formatToRupiahStyle(input))
                    .font(.headline)
                    .foregroundColor(input.isEmpty ? .gray : .black)
                    .onTapGesture {
                        showCustomNumpad = true
                    }

                Spacer()

                Button {
                    showCustomNumpad.toggle()
                } label: {
                    Image(systemName: "pencil")
                        .font(.body)
                        .foregroundColor(.gray)
                }
            }
            Divider().background(Color("PrimaryGreen"))
            if alertSiPlin{
                AlertSiPlin()
            }
            HStack{
                HStack(spacing: 12){
                    Text("Maksimum Limit")
                        .font(.system(size: 14))
                    Button {
                        showMaksimumLimitTooltip = true
                    }label: {
                        Image(systemName: "info.circle")
                            .font(.system(size: 12)).foregroundColor(Color("ToolTipBlue"))
                    }
                   
                        
                }
                Spacer()
                Text("Rp \(maximumLimit)").font(.system(size: 14))
            }

            
        }
        .padding(.vertical, 18)
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
        .onChange(of: input) { newValue in
            let clean = newValue.filter { $0.isNumber }
            if let intVal = Int(clean), intVal > maximumLimitPinjamanInt {
                input = maximumLimitPinjaman
                showToastCallback(.warning, "Maksimum jumlah pinjaman adalah Rp60.000.000")
            }
        }
    }
}


