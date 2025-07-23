//
//  KuponComponent.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//

import SwiftUI

struct KuponComponent: View {
    @Binding var showKuponModal : Bool
    var body: some View {
        HStack{
            HStack{
                Image("kupon").resizable().frame(width: 24, height: 24)
                Text("Kupon").font(.callout).fontWeight(.semibold)
            }
            Spacer()
            HStack{
                Text("Diskon biaya s/d 60%").font(.caption).foregroundColor(Color("DarkGreen"))
                Button{
                    showKuponModal = true
                }label:{
                    Image(systemName: "chevron.right").foregroundStyle(Color.black)
                }
            }
        }.padding(.vertical, 16)
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

