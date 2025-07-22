//
//  BungaTooltip.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//


import SwiftUI

struct BungaTooltip: View {
    @Binding var isPresented: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Spacer()
                Button(action: {
                    isPresented = false
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
            }
            Image("tooltip-jumlahpinjaman")
                .resizable()
                .frame(width: 60, height: 60)
            VStack(alignment: .leading, spacing: 12){
                Text("Bunga")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.top, 4)

                Text("Bunga harian 0.3% dihitung dari jumlah pinjaman kamu setiap hari selama tenor. Jumlah ini otomatis masuk ke total cicilan per bulan.")
                    .font(.body)
            }
            
            VStack(alignment: .leading, spacing: 12){
                Text("Biaya Layanan")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.top, 4)

                Text("Biaya administrasi atau operasional dari penyedia layanan pinjaman. Biaya ini otomatis masuk ke total cicilan per bulan.")
                    .font(.body)
            }
            
            VStack( alignment: .leading, spacing: 12){
                Text("PPn")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.top, 4)

                Text("Pajak pertambahan nilai yang dikenakan atas biaya layanan dan bunga sesuai regulasi pemerintah. Biaya ini otomatis masuk ke total cicilan per bulan.")
                    .font(.body)
            }

           
        }
        .padding(.horizontal, 22)
        .background(Color(.systemBackground))
        .cornerRadius(10)
    }
}

#Preview{
    BungaTooltipView()
}

// For Tooltip View
struct BungaTooltipView: View {
    @State private var showTooltip = false

    var body: some View {
        VStack {
            Button("Show Tooltip") {
                showTooltip = true
            }
        }
        .sheet(isPresented: $showTooltip) {
            BungaTooltip(isPresented: $showTooltip)
                           .presentationDetents([.height(550)])
        }
    }
}
