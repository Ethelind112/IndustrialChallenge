//
//  MaksimumLimitBox.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//

import SwiftUI

struct MaksimumLimitBox: View {
    @Binding var showMaksimumLimitTooltip: Bool
    var maximumLimit = formatToRupiahStyle(maximumLimitPinjaman)
    var body: some View {
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
        }.padding(.vertical, 16)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
            )
            .padding(.horizontal, 12)
    }
}
