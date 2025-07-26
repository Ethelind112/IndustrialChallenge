//
//  RecommendationSheet.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 23/07/25.
//

import SwiftUI

struct RecommendationSheet: View {
    @Binding var showSiPlinModal: Bool
    @Binding var borrowBind: String
    @Binding var currsiPlinStep: SiPlinStep
    @State var borrowingRequest: BorrowingLoanRequest
    var viewModel: RecommendationCalculation = RecommendationCalculation()
    @State var surplusNegative: Bool = false
    @State var rekomendasiTitle: String = ""
    @State var rekomendasioptionalTitle: String = ""
    
    @State var optionResult: BorrowingLoanRecommendation?
    @State var selectedOption: BorrowingLoan?
    
    @State var income: String
    @State var borrowed: String
    @StateObject var siPlinModel: SiPlinController
    
    @State var showOpsiUserInput: Bool = false
    @State var optionToShow: [BorrowingLoan] = []
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                HeaderExpense(currSiPlinStep: $currsiPlinStep, title: "Rekomendasi Pinjaman")
                    .padding(.top, 20)
                
                ScrollView {
                    VStack {
                        VStack {
                            Text("Yuk Pinjam Sesuai Surplusmu!")
                                .font(.system(size: 14, weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                            
                            
                            Text("Jumlah pinjaman yang kamu ajukan belum sesuai dengan kapabilitas keuanganmu saat ini.")
                                .font(.caption)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding(.vertical, 12)
                            
                            VStack {
                                
                                Button {
                                    showOpsiUserInput = false
                                } label: {
                                    DetailRecommendationComponent(backgroundColor: .primaryLightGreen, borderColor: .clear, sectionTitle: rekomendasiTitle, optionalText: rekomendasioptionalTitle, recommended: optionResult?.recommendationBorrowing?.jumlahDiterima ?? "0")
                                }
                                
                                
                                
                                if surplusNegative || borrowingRequest.deficit {
                                    
                                    Button {
                                        showOpsiUserInput = true
                                    } label: {
                                        DetailRecommendationComponent(backgroundColor: .white, borderColor: .additionalColorLightGray, sectionTitle: "Pinjaman yang diajukan", optionalText: "", recommended: siPlinModel.borrowed)
                                    }
                                    
                                }
                                
                            }
                            .foregroundColor(.black)
                        }
                        .padding(.bottom, 24)
                        
                        VStack {
                            
                            if !showOpsiUserInput {
                                Text("Eksplor Opsi Tenor")
                                    .font(.system(size: 14, weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                
                                if borrowingRequest.deficit {
                                    DeficitBanner(deficit: String(Int(borrowingRequest.expenseValue - borrowingRequest.incomeValue)).formatToRupiahStyle())
                                        .padding(.bottom, 24)
                                } else {
                                    SurplusBanner(surplus: String(Int(borrowingRequest.incomeValue - borrowingRequest.expenseValue)).formatToRupiahStyle())
                                        .padding(.bottom, 24)
                                }
                            } else {
                                VStack (alignment: .leading) {
                                    Text("Lanjut dengan Pinjaman yang Diajukan")
                                        .font(.system(size: 14, weight: .bold))
                                        .bold()
                                    
                                    AlertPilihanPinjaman()
                                        .padding(.bottom, 24)
                                }
                            }
                            
                            if showOpsiUserInput || (!surplusNegative && !borrowingRequest.deficit) {
                                ForEach(optionToShow) { option in
                                    OptionComponentBasedOnInput(option: option, selectedOption: $selectedOption, borrowingRequest: option)
                                }
                            } else if !showOpsiUserInput {
                                ForEach(optionToShow) { option in
                                    OptionComponent(option: option, selectedOption: $selectedOption, borrowingRequest: option)
                                    
                                }
                            }
                        }
                    }
                }
                .padding(.top, 5)
                
                Button{
                    if let borrowResult = selectedOption?.jumlahDiterima {
                        borrowBind = borrowResult.formatWithoutDot()
                        showSiPlinModal = false
                    }
                    
                }label: {
                    
                    if selectedOption == nil {
                        RecommendationViewButton(textButton: "Gunakan Opsi", textColor: .gray, backgroundColor: .additionalColorLightGray)
                    } else {
                        RecommendationViewButton(textButton: "Gunakan Opsi", textColor: .white, backgroundColor: .primaryGreen)
                    }
                    
                    
                }
                .disabled(selectedOption == nil)

            }
            .padding(.horizontal, 20)
        }
        .onAppear {
            (optionResult, surplusNegative) = viewModel.calculateResult(loanRequest: borrowingRequest)
            
            if borrowingRequest.deficit || surplusNegative{
                rekomendasiTitle = "Rekomendasi Peminjaman Tertinggi"
            }else {
                rekomendasiTitle = "Rekomendasi Pinjaman"
            }
            
            if borrowingRequest.deficit{
                rekomendasioptionalTitle = "Sesuai defisit dana"
            }
            
            optionToShow = Array(optionResult?.borrowingLoan.prefix(3) ?? [])
        }
        .onChange(of: showOpsiUserInput) {
            if !showOpsiUserInput {
                optionToShow = Array(optionResult?.borrowingLoan.prefix(3) ?? [])
            } else {
                optionToShow = Array(optionResult?.borrowingLoan.suffix(3) ?? [])
            }
        }
    }
}

//#Preview {
//    @Previewable @State var currSiPlinStep = SiPlinStep.siPlinBorrowing
//    @Previewable @StateObject var viewModel = StateObject(wrappedValue: SiPlinController(income: "9000000", borrowed: "9000000", expense: "10000000"))
//    
//    RecommendationSheet(currsiPlinStep: $currSiPlinStep, borrowingRequest: BorrowingLoanRequest(expense: "9000000", income: "9000000", borrowingNeed: "9000000"), income: "9000000", borrowed: "9000000", siPlinModel: $viewModel)
//}
