//
//  BorrowingNeedSheet.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import SwiftUI

struct BorrowingNeedSheet: View {
    
    @Binding var borrowed: String
    @Binding var currSiPlinStep: SiPlinStep
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaaderBorrowingNeed()
                
                VStack {
                    Text("Langsung dapatkan jumlah pinjaman yang sesuai dengan kapabilitasmu!")
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    KetahuiSiPlin()
                    
                    Spacer()
                    
                    IsiPinjamComponent(borrowed: $borrowed)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                Rectangle()
                    .frame(height: 1, alignment: .bottom)
                    .foregroundColor(Color("AdditionalColorLightGray"))
                
                Spacer()
                
                VStack {
                    
                    VStack {
                        
                        NumberKeyboard(inputs: $borrowed)
                            .padding(.horizontal, 30)
                        
                        Button {
                            currSiPlinStep = .siPlinExpense
                        } label: {
                            LanjutButton()
                                .padding(.top, 30)
                        }
//                        .padding(.top)
                        
                    }
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(height: 300)
                    
                }
                .padding(.vertical, 40)
                
                Spacer()
                
            }
        }
    }
}

//#Preview {
//    BorrowingNeedSheet(borrowed: "9000000")
//}
