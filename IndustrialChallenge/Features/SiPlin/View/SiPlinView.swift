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
    
    @State var income: String
    @State var borrowed: String
    @State var expense: String = ""
    
    @StateObject var viewModel: SiPlinController
    
    @State var currSiPlinStep = SiPlinStep.siPlinBorrowing
    
    init(income: String, borrowed: String) {
        let expense = ""
        let formattedIncome = income.formatToRupiahStyle()
        let formattedBorrowed = borrowed.formatToRupiahStyle()
        
        self.income = formattedIncome
        self.borrowed = formattedBorrowed
        self.expense = expense
        _viewModel = StateObject(wrappedValue: SiPlinController(income: formattedIncome, borrowed: formattedBorrowed, expense: expense))
        
        self.currSiPlinStep = SiPlinStep.siPlinBorrowing
    }
    
    var body: some View {
        switch currSiPlinStep {
        case .siPlinBorrowing:
            BorrowingNeedSheet(borrowed: $viewModel.borrowed, currSiPlinStep: $currSiPlinStep)
            
        case .siPlinExpense:
            ExpenseSheet(viewModel: viewModel, currSiPlinStep: $currSiPlinStep)
        case .siPlinRecommendation:
            RecommendationSheet(currsiPlinStep: $currSiPlinStep, borrowingRequest: viewModel.loanRequest, income: income, borrowed: borrowed, siPlinModel: viewModel)
        }
        
    }
}

#Preview {
    SiPlinView(income: "9000000", borrowed: "9000000")
}
