//
//  JumlahPinjamanTooltip.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//

import SwiftUI

struct JumlahPinjamanTooltip: View {
    @Binding var isPresented: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Spacer()
                Button(action: {
                    isPresented = false
                }) {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
            }
            Image("tooltip-jumlahpinjaman")
                .resizable()
                .frame(width: 60, height: 60)

            Text("Jumlah Pinjaman")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.top, 4)

            Text("Jumlah pinjaman dapat anda ajukan berdasarkan ketentuan batasan limit yang tersedia. Misal limit yang anda dapatkan adalah Rp10.000.000, maka anda dapat meminjam hingga maksimal Rp10.000.000 juga, sesuai dengan nominal limit tersebut.")
                .font(.body)
        }
        .padding(.horizontal, 22)
        .background(Color(.systemBackground))
        .cornerRadius(10)
    }
}

#Preview{
    JumlahPinjamanTooltipView()
}

// For Tooltip View
struct JumlahPinjamanTooltipView: View {
    @State private var showTooltip = false

    var body: some View {
        VStack {
            Button("Show Tooltip") {
                showTooltip = true
            }
        }
        .sheet(isPresented: $showTooltip) {
            JumlahPinjamanTooltip(isPresented: $showTooltip)
                           .presentationDetents([.height(320)])
        }
    }
}
