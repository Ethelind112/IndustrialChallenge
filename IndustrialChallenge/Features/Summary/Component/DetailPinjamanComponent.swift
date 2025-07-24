//
//  DetailPinjamanComponent.swift
//  IndustrialChallenge
//
//  Created by Amanda on 24/07/25.
//

import SwiftUI

struct DetailPinjamanComponent : View {
    var body : some View{
        VStack(alignment: .leading, spacing: 16){
            Text("Detail Pinjaman").font(.callout).fontWeight(.semibold)
            
            VStack(spacing: 12){
                HStack {
                    Text("Rekening Penerima")
                        .font(.system(size: 14))
                    Spacer()
                    HStack(spacing: 4){
                        Text("BCA *267188223")
                            .fontWeight(.medium)
                            .font(.system(size: 14))
                        
                        Image(systemName: "chevron.right")
                            .fontWeight(.medium)
                            .font(.system(size: 14))
                    }
                   
                }
                
                HStack {
                    Text("Tujuan Pinjaman")
                        .font(.system(size: 14))
                    Spacer()
                    HStack(spacing: 4){
                        Text("Konsumtif")
                            .fontWeight(.medium)
                            .font(.system(size: 14))
                        
                        Image(systemName: "chevron.right")
                            .fontWeight(.medium)
                            .font(.system(size: 14))
                    }
                   
                }
               
            }
            
            
        }
        .padding(.vertical, 22)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color("AdditionalColorLightGray"), lineWidth: 1)
                )
        )
        .padding(.horizontal, 12)
        
        
      
        
    }
}
