//
//  OptionComponentBasedOnInput.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 24/07/25.
//

import SwiftUI

struct OptionComponentBasedOnInput: View {
    @State var option: BorrowingLoan
    @Binding var selectedOption: BorrowingLoan?
    var borrowingRequest: BorrowingLoan
    
    var body: some View {
        HStack (alignment: .top) {
            if let selected = selectedOption {
                Image(systemName: selected.id == option.id ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(.primaryGreen)
            } else {
                Image(systemName: "circle")
                    .foregroundColor(.primaryGreen)
            }
            
            VStack (alignment: .leading) {

                HStack {
                    Text("\(String(borrowingRequest.tenor)) Bulan")
                        .bold()
                }
                
                HStack {
                    Text("Cicilan Perbulan")
                        
                    
                    Spacer()
                    
                    Text("Rp \(borrowingRequest.cicilanPerBulan)")
                        .bold()
                }
                .padding(.top, 5)
                
                HStack {
                    Text("Total Cicilan")
                        .font(.system(size: 14))
                    
                    Spacer()
                    
                    Text("Rp \(borrowingRequest.totalCicilan)")
                        .padding(.top, 1)
                }
                
            }
            .font(.system(size: 14))

        }
        .onTapGesture {
            selectedOption = option
            
        }
        .padding(20)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.additionalColorLightGray, lineWidth: 1)
        )
    }
}
