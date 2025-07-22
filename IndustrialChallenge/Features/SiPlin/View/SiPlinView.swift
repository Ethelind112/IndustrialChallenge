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
    
//    nanti binding
    @State var income: String = "10000000"
    @State var borrowed: String = "9000000"
    @State var expense: String = ""
    
    @State var showSiPlinBorrowing: Bool = true
    @State var showSiPlinExpense: Bool = false
    @State var showSiPlinRecommendation: Bool = false
    
    @State var currSiPlinStep = SiPlinStep.siPlinBorrowing
    
    var body: some View {
        
        switch currSiPlinStep {
        case .siPlinBorrowing:
            BorrowingNeedSheet(borrowed: $borrowed, currSiPlinStep: $currSiPlinStep)
            
        case .siPlinExpense:
            ExpenseSheet(expenses: $expense, borrowed: $borrowed, currSiPlinStep: $currSiPlinStep, income: $income)
        case .siPlinRecommendation:
            Text("Recommendation")
        }
        
    }
}

#Preview {
    SiPlinView()
}
