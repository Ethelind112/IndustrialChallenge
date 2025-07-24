//
//  HeaaderBorrowingNeed.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 23/07/25.
//

import SwiftUI

struct HeaaderBorrowingNeed: View {
    var body: some View {
        HStack (alignment: .center) {
            Image("SiPlinLogo_Analyzer")
                .padding(.trailing, 20)
            
            VStack (alignment: .leading){
                Text("SiPlin")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Si Pintar Planning")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.primaryGreen)
            }
            
            Spacer()
            
        }
        .background{
            Image("HeaderBackground_Analyzer")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 20)
    }
}

#Preview {
    HeaaderBorrowingNeed()
}
