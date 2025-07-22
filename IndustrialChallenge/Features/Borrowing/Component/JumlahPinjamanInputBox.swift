//
//  JumlahPinjamanInputBox.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//

import SwiftUI

struct JumlahPinjamanInputBox: View {
    @State private var input: String = ""
    @Binding var showJumlahPinjamanTooltipModal: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12){
                Text("Jumlah Pinjaman")
                    .font(.body).fontWeight(.semibold)
                Button {
                    showJumlahPinjamanTooltipModal = true
                                } label: {
                                    Image(systemName: "info.circle")
                                        .font(.callout)
                                        .foregroundColor(Color("ToolTipBlue"))
                                }
            }
            HStack{
                Text(input.isEmpty ? "Rp. 1.000.000" : "Rp. \(input)")
                    .font(.title2)
                    .foregroundColor(input.isEmpty ? .gray : .black).padding(.top, 8)
                Spacer()
                Image(systemName: "pencil").font(.body).foregroundStyle(Color.gray)
            }
           
            Divider().background(Color("PrimaryGreen"))
        }.padding(.vertical, 24)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 4)
            )
            .padding(.horizontal, 12)
    }
}

