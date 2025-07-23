//
//  OptionComponent.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 23/07/25.
//

import SwiftUI

struct OptionComponent: View {
    @State var option: String
    @State var selectedOption: String
    
    var body: some View {
        HStack (alignment: .top) {
            Image(systemName: selectedOption == option ? "largecircle.fill.circle" : "circle")
                .foregroundColor(.primaryGreen)
                
            
            VStack (alignment: .leading) {
                Text(option)
                    .bold()
                
                HStack {
                    Text("Cicilan Perbulan")
                        
                    
                    Spacer()
                    
                    Text("Rp 9.000.000")
                        .bold()
                }
                .padding(.top, 8)
                
                HStack {
                    Text("Total Cicilan")
                        .font(.system(size: 14))
                    
                    Spacer()
                    
                    Text("Rp 9.000.000")
                        .padding(.top, 3)
                }
                
            }
            .font(.system(size: 14))

        }
        .padding(20)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.additionalColorLightGray, lineWidth: 1)
        )
    }
}

#Preview {
    OptionComponent(option: "3 Bulan", selectedOption: "3 Bulan")
}
