//
//  MaksimumLimitBox.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//

import SwiftUI

struct MaksimumLimitBox: View {
    @Binding var showMaksimumLimitTooltip: Bool
    var body: some View {
        HStack{
            HStack(spacing: 12){
                Text("Maksimum Limit")
                    .font(.callout)
                Button {
                    showMaksimumLimitTooltip = true
                }label: {
                    Image(systemName: "info.circle")
                        .font(.callout).foregroundColor(Color("ToolTipBlue"))
                }
               
                    
            }
            Spacer()
            Text("Rp. 60.000.000,00")
                    .font(.callout)
        }.padding(.vertical, 22)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 4)
            )
            .padding(.horizontal, 12)
    }
}
