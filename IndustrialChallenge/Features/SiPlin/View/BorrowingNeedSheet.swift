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
    @State var showToast = false
    @State var showToast2 = false
    @State var isError = false
    
    var body: some View {
        NavigationStack {
            ZStack (alignment: .top) {
                if showToast2 {
                    ToastView(type: .warning, message: "Nominal pinjaman melebihi maksimum limit! ")
                        .transition(.move(edge: .top).combined(with: .opacity))
                        .zIndex(999)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                withAnimation {
                                    showToast = false
                                }
                            }
                        }
                }
                
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
                        
                        IsiPinjamComponent(borrowed: $borrowed, isError: $isError)
                        
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
                                if borrowed == "" || borrowed == "0" || isError {
                                    LanjutButton(textColor: .gray, backgroundColor: .additionalColorLightGray)
                                        .padding(.top, 30)
                                } else {
                                    LanjutButton(textColor: .white, backgroundColor: .primaryGreen)
                                        .padding(.top, 30)
                                }
                            }
                            .disabled(isError)
                            
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
            .onChange(of: borrowed) {
                isError = Int(borrowed.formatWithoutDot()) ?? 0 > maximumLimitPinjamanInt
                
                if isError {
                    showToast = true
                }
            }
            .onChange(of: showToast) {
                showToast2 = showToast
            }
        }
    }
}

//#Preview {
//    BorrowingNeedSheet(borrowed: "9000000")
//}
