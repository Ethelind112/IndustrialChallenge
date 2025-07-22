//
//  DurasiTenorTooltip.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//


import SwiftUI

struct DurasiTenorTooltip: View {
    @Binding var isPresented: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
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

            Text("Durasi Tenor")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.top, 4)

            Text("Jangka waktu kamu untuk melunasi pinjaman. Semakin lama tenornya, cicilan perbulan bisa lebih ringan, tetapi total cicilan semakin besar.")
                .font(.body)
        }
        .padding(.horizontal, 22)
        .background(Color(.systemBackground))
        .cornerRadius(10)
    }
}

#Preview{
   DurasiTenorTooltipView()
}

// For Tooltip View
struct DurasiTenorTooltipView: View {
    @State private var showTooltip = false

    var body: some View {
        VStack {
            Button("Show Tooltip") {
                showTooltip = true
            }
        }
        .sheet(isPresented: $showTooltip) {
            DurasiTenorTooltip(isPresented: $showTooltip)
                           .presentationDetents([.height(250)])
        }
    }
}
