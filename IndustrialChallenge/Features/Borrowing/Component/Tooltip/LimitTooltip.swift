//
//  LimitTooltip.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//


import SwiftUI

struct LimitTooltip: View {
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

            Text("Maksimum Limit")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.top, 4)

            Group {
                        (
                            Text("Maksimum Limit pinjaman kamu dapat bervariasi, tergantung dengan kelengkapan dokumen yang kamu serahkan dan ketentuan persyaratan penyerahan dokumen yang harus kamu tepati. Simak cara menaikkan limit ")
                            +
                            Text("disini")
                                .foregroundColor(.green)
                                .underline()
                            + Text(".")
                        )
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .onTapGesture {
                            if let url = URL(string: "https://easycash.id/blog/cara-meningkatkan-limit-easycash") {
                                UIApplication.shared.open(url)
                            }
                        }
                    }
        }
        .padding(.horizontal, 22)
        .background(Color(.systemBackground))
        .cornerRadius(10)
    }
}

#Preview{
    LimitTooltipView()
}

// For Tooltip View
struct LimitTooltipView: View {
    @State private var showTooltip = false

    var body: some View {
        VStack {
            Button("Show Tooltip") {
                showTooltip = true
            }
        }
        .sheet(isPresented: $showTooltip) {
            LimitTooltip(isPresented: $showTooltip)
                           .presentationDetents([.height(320)])
        }
    }
}
