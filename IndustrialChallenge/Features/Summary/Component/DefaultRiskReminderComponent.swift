//
//  DefaultRiskReminderComponent.swift
//  IndustrialChallenge
//
//  Created by Amanda on 24/07/25.
//

import SwiftUI

struct DefaultRiskReminderComponent: View {
    @State private var isExpanded = false
    var body: some View {
        
        VStack(spacing: 0) {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    HStack(spacing: 4){
                        Image(systemName: "exclamationmark.triangle.fill") .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text("Apa yang terjadi jika gagal bayar?")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.black)
                }
                .padding()
                .background(
                    RoundedCorner(radius: 16)
                        .fill(Color.white)
                        .overlay(
                            RoundedCorner(radius: 16)
                                .stroke(Color("AdditionalColorLightGray"), lineWidth: 1)
                        )
                )
            }

            if isExpanded {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Kamu akan dikenakan denda keterlambatan,       . cek di sini").font(.system(size: 13)).fontWeight(.regular)
                    Text("Skor kredit kamu di SLIK OJK akan terpengaruh").font(.system(size: 13)).fontWeight(.regular)
                    Text("Tim penagihan kami akan menghubungi kamu secara berkala").font(.system(size: 13)).fontWeight(.regular)
                    
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
        }.padding(.horizontal)
    }
}
