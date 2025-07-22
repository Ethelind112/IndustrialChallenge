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
                
                VStack {
                    Text("Langsung dapatkan jumlah pinjaman yang sesuai dengan kapabilitasmu!")
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    HStack {
                        Image("StatusBarIcon")
                        
                        Text("Ketahui SiPlin Disini")
                            .foregroundColor(.primaryGreen)
                            .font(.caption)
                            .fontWeight(.medium)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(
                        RadialGradient(
                            gradient: Gradient(colors: [
                                Color.white.opacity(0.5),
                                Color.additionalColorGreen.opacity(0.5)
                            ]),
                            center: UnitPoint(x: -0.0324, y: 1.1125),
                            startRadius: 0,
                            endRadius: 200
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 3.5))
                    )
                    .border(.primaryGreen, width: 0.44)
                    .cornerRadius(3.5)
                    
                    Spacer()
                    
                    VStack (alignment: .leading) {
                        Text("Mau Pinjam Berapa?")
                            .font(.caption)
                            .fontWeight(.bold)
                        
                        HStack {
                            Text("Rp")
                            
                            TextField("Jumlah Pinjaman", text: $borrowed)
                                .disabled(true)
                        }
                        .font(.title3)
                        .fontWeight(.bold)
                        
                        Rectangle()
                            .frame(height: 1, alignment: .bottom)
                            .foregroundColor(.primaryGreen)
                        
                        HStack {
                            Text("Maksimum Limit Pinjaman")
                            Spacer()
                            Text("Rp. 60.000.000")
                        }
                        .font(.caption)
                        
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                Rectangle()
                    .frame(height: 1, alignment: .bottom)
                    .foregroundColor(Color(.lightGray))
                
                Spacer()
                
                VStack {
                    
                    VStack {
                        
                        NumberKeyboard(inputs: $borrowed)
                        
                        Button {
                            currSiPlinStep = .siPlinExpense
                            
                        }label: {
                            Text("Lanjut")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
                                .background(.primaryGreen)
                                .cornerRadius(14)
                                .foregroundColor(.white)
                                .font(.footnote)
                                .fontWeight(.bold)
                            
                        }
                        .padding(.horizontal, 35)
                        .padding(.top, 30)
                    }
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(height: 300)
                    
                }
                .padding(.vertical, 40)
                .padding(.horizontal, 30)
                
                Spacer()
                
            }
        }
    }
}

//#Preview {
//    BorrowingNeedSheet(borrowed: "9000000")
//}
