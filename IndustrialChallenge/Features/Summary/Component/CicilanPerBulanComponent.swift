//
//  CicilanPerBulanComponent.swift
//  IndustrialChallenge
//
//  Created by Amanda on 24/07/25.
//

import SwiftUI

struct CicilanPerBulanComponent: View {
    let cicilanPerBulan : String
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            HStack{
                Text("Cicilan Perbulan").font(.callout).fontWeight(.semibold)
                Spacer()
                Text("Rp \(formatToRupiahStyle(cicilanPerBulan))").font(.system(size: 14)).fontWeight(.semibold)
            }.padding(.bottom, 4)
            Text("Jatuh tempo pertama 10 Agustus 2025").font(.system(size: 13)).fontWeight(.semibold)
            Text("Pembayaran dilakukan setiap tanggal 10 di bulan berjalan").font(.system(size: 13)).italic()
        }
        
        .frame(maxWidth: .infinity, alignment: .leading)
        .multilineTextAlignment(.leading)
        .padding(.horizontal, 16)
        .padding(.vertical, 18)
        .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color("SecondaryLightGreen"))
            )
        
        .padding(.horizontal, 12)
    }
}
