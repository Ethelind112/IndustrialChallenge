//
//  JumlahDiterimaDropdownComponent.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//

import SwiftUI

struct JumlahDiterimaDropdownComponent: View {
    @State private var isExpanded = false
    let jumlahDiterima: String
    let jumlahPengajuan: String

    var body: some View {
        VStack(spacing: 0) {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text("Jumlah Diterima")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    Spacer()
                    Text("Rp. " + formatToRupiahStyle(jumlahDiterima))
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.black)
                }
                .padding()
                .background(
                    RoundedCorner(radius: 16, corners: [.topLeft, .topRight])
                        .fill(Color.white)
                        .overlay(
                            RoundedCorner(radius: 16, corners: [.topLeft, .topRight])
                                .stroke(Color("AdditionalColorLightGray"), lineWidth: 1)
                        )
                )
            }

            if isExpanded {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Jumlah Pengajuan")
                            .font(.system(size: 14))
                        Spacer()
                        Text("Rp. " + formatToRupiahStyle(jumlahDiterima))
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("PrimaryGreen"))
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
//        .background(Color(.systemGray6))
//        .cornerRadius(12)
        .padding()
//        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

