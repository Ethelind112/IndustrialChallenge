//
//  AlertSiPlin.swift
//  IndustrialChallenge
//
//  Created by Amanda on 28/07/25.
//

import SwiftUI

struct AlertSiPlin: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6){
            HStack(spacing: 4){
                Image(systemName: "exclamationmark.triangle.fill") .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Text("Apakah kamu yakin")
                    .font(.system(size: 13))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            Text("Jumlah pinjaman ini melebihi rekomendasi SiPlin. Pastikan kamu mempertimbangkan dulu pengeluaran rutinnmu ya!") .font(.system(size: 12))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .padding(.horizontal,8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color("SecondaryLightestYellow"))
        )
    }
}
