//
//  SurplusBanner.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 23/07/25.
//

import SwiftUI

struct SurplusBanner: View {
    @State var surplus: String = "0"
    
    var body: some View {
        HStack {
            ZStack (alignment: .bottom) {
                HStack (alignment: .top) {
                    Image("Raw_SiPlin")
                        
                    VStack {
                        Text("Dengan surplus dana per bulan sebesar ") + Text("Rp\(surplus)").bold() + Text(", kamu dapat memilih opsi tenor pinjaman sesuai kenyamananmu.")
                    }
                    .font(.caption)
                    
                    Spacer()
                }
                
                
            }
        }
        .padding([.top, .trailing], 15)
        .frame(maxWidth: .infinity)
        .background(.secondaryLightestYellow)
        .cornerRadius(8)
    }
}

#Preview {
    SurplusBanner()
}
