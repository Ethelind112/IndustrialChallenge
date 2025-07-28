//
//  SiPlinView.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import SwiftUI

enum SiPlinStep {
    case siPlinBorrowing
    case siPlinExpense
    case siPlinRecommendation
}

struct SiPlinView: View {
    @Binding var showOnBoarding: Bool
    @Binding var toastType: ToastType
    @Binding var message: String
    @Binding var showSuccessToast: Bool
    
    @Binding var selectedTenor: LoanOption
    @Binding var borrowBind: String
    @Binding var showSiPlinModal: Bool
    @Binding var siPlinRecommendation: Bool
    @Binding var rekomendasiPinjaman: String
    // STEP
    @Binding var currSiPlinStep: SiPlinStep
    @State var income: String
    @State var borrowed: String
    @State var expense: String
    
    @StateObject var viewModel: SiPlinController

    
    init(showOnBoarding: Binding<Bool>, showSuccessToast: Binding<Bool>, toastType: Binding<ToastType>, message: Binding<String>, selectedLoanOption: Binding<LoanOption>, showSiPlinModal: Binding<Bool>, borrowBind: Binding<String>, income: String, siPlinRecommendation: Binding<Bool>, rekomendasiPinjaman: Binding<String>, currSiPlinStep: Binding<SiPlinStep>) {
        self._showOnBoarding = showOnBoarding
        self._showSuccessToast = showSuccessToast
        self._toastType = toastType
        self._message = message
        self._siPlinRecommendation = siPlinRecommendation
        self._rekomendasiPinjaman = rekomendasiPinjaman
        
        self._selectedTenor = selectedLoanOption
        self._borrowBind = borrowBind
        self._showSiPlinModal = showSiPlinModal
        
        let expense = ""
        let formattedIncome = income.formatToRupiahStyle()
        let formattedBorrowed = borrowBind.wrappedValue.formatToRupiahStyle()
        
        self.income = formattedIncome
        self.borrowed = formattedBorrowed
        self.expense = expense
        _viewModel = StateObject(wrappedValue: SiPlinController(income: formattedIncome, borrowed: formattedBorrowed, expense: expense))
        
        self._currSiPlinStep = currSiPlinStep
        
    }
    
    var body: some View {
        switch currSiPlinStep {
        case .siPlinBorrowing:
            BorrowingNeedSheet(borrowed: $viewModel.loanRequest.borrowingNeed, currSiPlinStep: $currSiPlinStep, showOnBoarding: $showOnBoarding, showSiPlinModal: $showSiPlinModal)
            
        case .siPlinExpense:
            ExpenseSheet(viewModel: viewModel, currSiPlinStep: $currSiPlinStep)
        case .siPlinRecommendation:
            RecommendationSheet(showSuccessToast: $showSuccessToast, toastMessage: $message, toastType: $toastType, selectedOptionTenor: $selectedTenor, showSiPlinModal: $showSiPlinModal, borrowBind: $borrowBind, currsiPlinStep: $currSiPlinStep, siPlinRecommendation: $siPlinRecommendation, rekomendasiPinjaman: $rekomendasiPinjaman, borrowingRequest: viewModel.loanRequest, income: income, borrowed: borrowed, siPlinModel: viewModel)
        }
        
    }
}
//
//#Preview {
//    @Previewable @State var borrow = "9000000"
//    @Previewable @State var showSiPlinModal = true
//    @Previewable @State var selectedLoanOption = loanOptions[2]
//    
//    @Previewable @State var toastType: ToastType = .success
//    
//    @Previewable @State var message: String = "Nominal pinjaman berhasil dimasukkan!"
//    
//    @Previewable @State var showSuccessToast: Bool = false
//    @Previewable @State var showOnBoarding: Bool = false
//    
//    SiPlinView(showOnBoarding: $showOnBoarding, showSuccessToast: $showSuccessToast, toastType: $toastType, message: $message, selectedLoanOption: $selectedLoanOption, showSiPlinModal: $showSiPlinModal, borrowBind: $borrow, income: "9000000")
//}
