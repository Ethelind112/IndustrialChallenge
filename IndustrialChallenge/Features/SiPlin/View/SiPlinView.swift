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
    
    @State var income: String = "10000000"
    @State var borrowed: String = "9000000"
    @State var expense: String = ""
    
    @StateObject var viewModel: SiPlinController
    
    
    @State var currSiPlinStep = SiPlinStep.siPlinBorrowing
    
    init(income: String, borrowed: String) {
        let expense = ""
        
        self.income = income
        self.borrowed = borrowed
        self.expense = expense
        _viewModel = StateObject(wrappedValue: SiPlinController(income: income, borrowed: borrowed, expense: expense))
        
        self.currSiPlinStep = SiPlinStep.siPlinBorrowing
    }
    
    var body: some View {
        
        switch currSiPlinStep {
        case .siPlinBorrowing:
            BorrowingNeedSheet(borrowed: $viewModel.borrowed, currSiPlinStep: $currSiPlinStep)
            
        case .siPlinExpense:
            ExpenseSheet(viewModel: viewModel, currSiPlinStep: $currSiPlinStep)
        case .siPlinRecommendation:
            Text("Recommendation")
        }
        
    }
}

#Preview {
    SiPlinView(income: "9000000", borrowed: "9000000")
}
