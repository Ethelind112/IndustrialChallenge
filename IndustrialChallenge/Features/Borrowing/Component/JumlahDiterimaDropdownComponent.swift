//
//  JumlahDiterimaDropdownComponent.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//

import SwiftUI

struct JumlahDiterimaDropdownComponent: View {
    @State private var isExpanded = false

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
                    Text("Rp 6.000.000,00")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white)
                .clipShape(RoundedCorner(radius: 12, corners: [.topLeft, .topRight]))
            }

            if isExpanded {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Jumlah Pengajuan")
                            .font(.system(size: 14))
                        Spacer()
                        Text("Rp 6.000.000,00")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("PrimaryGreen"))
                    }
                    
                }
                .padding()
                .background(Color.white)
                
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

