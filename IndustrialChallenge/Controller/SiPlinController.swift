//
//  SiPlinController.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import Foundation

class SiPlinController: ObservableObject {
    @Published var income: String
    @Published var borrowed: String
    @Published var expense: String
    
    var loanRequest: BorrowingLoanRequest {
        BorrowingLoanRequest(expense: expense, income: income, borrowingNeed: borrowed)
    }
    
    init(income: String, borrowed: String, expense: String) {
        self.income = income
        self.borrowed = borrowed
        self.expense = expense
    }
}
