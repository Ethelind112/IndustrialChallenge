//
//  RecommendationSheet.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 23/07/25.
//

import SwiftUI
import SwiftData
struct RecommendationSheet: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \BorrowingLoanRequest.createdAt, order: .reverse) var existingRecords: [BorrowingLoanRequest]

    @Binding var showSuccessToast: Bool
    @Binding var toastMessage: String
    @Binding var toastType: ToastType
    
    @Binding var selectedOptionTenor: LoanOption
    @Binding var showSiPlinModal: Bool
    @Binding var borrowBind: String
    @Binding var currsiPlinStep: SiPlinStep
    @Binding var siPlinRecommendation: Bool
    @Binding var rekomendasiPinjaman:String
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
                                    if !showOpsiUserInput {
                                        DetailRecommendationComponent(backgroundColor: .primaryLightGreen, borderColor: .clear, sectionTitle: rekomendasiTitle, optionalText: rekomendasioptionalTitle, recommended: optionResult?.recommendationBorrowing?.jumlahDiterima ?? "0")
                                    } else {
                                        DetailRecommendationComponent(backgroundColor: .white, borderColor: .additionalColorLightGray, sectionTitle: rekomendasiTitle, optionalText: rekomendasioptionalTitle, recommended: optionResult?.recommendationBorrowing?.jumlahDiterima ?? "0")
                                    }
                                    
                                }
                                
                                
                                
                                if surplusNegative || borrowingRequest.deficit {
                                    
                                    Button {
                                        showOpsiUserInput = true
                                        
                                    } label: {
                                        if !showOpsiUserInput {
                                            DetailRecommendationComponent(backgroundColor: .white, borderColor: .additionalColorLightGray, sectionTitle: "Pinjaman yang diajukan", optionalText: "", recommended: siPlinModel.borrowed)
                                        } else {
                                            DetailRecommendationComponent(backgroundColor: .primaryLightGreen, borderColor: .clear, sectionTitle: "Pinjaman yang diajukan", optionalText: "", recommended: siPlinModel.borrowed)
                                        }
                                        
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
                    if let borrowResult = selectedOption {
                        borrowBind = borrowResult.jumlahDiterima.formatWithoutDot()
                        rekomendasiPinjaman = borrowResult.jumlahDiterima
                        let record = BorrowingLoanRequest(
                            expense: borrowingRequest.expense,
                            income: borrowingRequest.income,
                            borrowingNeed: borrowingRequest.borrowingNeed
                        )

                        modelContext.insert(record)

                        do {
                            try modelContext.save()
                            print("Saved borrowing record to SwiftData.")
                        } catch {
                            print("❌ Failed to save record: \(error)")
                        }

                        
                        showSiPlinModal = false
                        showSuccessToast = true
                        toastType = .success
                        toastMessage = "Nominal pinjaman berhasil dimasukkan!"
                        siPlinRecommendation = true
                        
                        var index = 0
                        
                        if borrowResult.tenor == 6 {
                            index = 0
                        } else if borrowResult.tenor == 9 {
                            index = 1
                        }else {
                            index = 2
                        }
                        
                        selectedOptionTenor = loanOptions[index]
                    }
                    
                }label: {
                    
                    if selectedOption == nil {
                        RecommendationViewButton(textButton: "Gunakan Opsi", textColor: .gray, backgroundColor: .additionalColorLightGray, siPlinRecommendation: $siPlinRecommendation)
                    } else {
                        RecommendationViewButton(textButton: "Gunakan Opsi", textColor: .white, backgroundColor: .primaryGreen, siPlinRecommendation: $siPlinRecommendation)
                    }
                    
                    
                }
                .disabled(selectedOption == nil)

            }
            .padding(.horizontal, 20)
        }
        .onAppear {
            if let lastRecord = existingRecords.first {
                borrowingRequest = BorrowingLoanRequest(
                    expense: lastRecord.expense,
                    income: lastRecord.income,
                    borrowingNeed: lastRecord.borrowingNeed
                )
                print("✅ Loaded existing BorrowingLoanRecord from SwiftData")
            } else {
                print("ℹ️ No existing BorrowingLoanRecord found")
            }
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
