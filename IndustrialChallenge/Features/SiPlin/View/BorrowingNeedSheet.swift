//
//  BorrowingNeedSheet.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import SwiftUI
import SwiftData

struct BorrowingNeedSheet: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var borrowed: String
    @Binding var currSiPlinStep: SiPlinStep
    @State var showToast = false
    @State var showToast2 = false
    @State var isError = false
    @State var isEmpty = false
    @Binding var showOnBoarding: Bool
    @Binding var showSiPlinModal: Bool
    
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
                        
                       
                        KetahuiSiPlin(showSiPlinModal: $showSiPlinModal, showOnBoarding: $showOnBoarding)
                            .shadow(color: Color.black.opacity(0.25), radius: 3.5, x: 0, y: 4)
                        
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
                                if !isEmpty && !isError {
                                    currSiPlinStep = .siPlinExpense
                                }
                                
                            } label: {
                                if borrowed == "" || borrowed == "0" || isError {
                                    LanjutButton(textColor: .gray, backgroundColor: .additionalColorLightGray)
                                        .padding(.top, 30)
                                } else {
                                    LanjutButton(textColor: .white, backgroundColor: .primaryGreen)
                                        .padding(.top, 30)
                                }
                            }
                            
                        }
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(height: 300)
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 40)
                    
                    Spacer()
                    
                }
            }
            .onAppear {
                    Task {
                        do {
                            let descriptor = FetchDescriptor<BorrowingLoanRequest>()
                            let records = try modelContext.fetch(descriptor)
                            for record in records {
                                modelContext.delete(record)
                            }
                            try modelContext.save()
                            print("✅ Deleted all BorrowingLoanRequest data on appear.")
                        } catch {
                            print("❌ Failed to delete BorrowingLoanRequest: \(error)")
                        }
                    }
                }
            .onChange(of: borrowed) {
                isError = Int(borrowed.formatWithoutDot()) ?? 0 > maximumLimitPinjamanInt
                
                if borrowed == "" || borrowed == "0" {
                    isEmpty = true
                } else {
                    isEmpty = false
                }
                
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
