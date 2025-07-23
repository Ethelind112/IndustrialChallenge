//
//  SiPlinController.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import Foundation

class SiPlinController: ObservableObject {
    @Published var loanRequest: BorrowingLoanRequest
    
    var income: String {
        loanRequest.income
    }
    
    var borrowed: String {
        loanRequest.borrowingNeed
    }
    
    var expense: String {
        loanRequest.expense
    }
    
    init(income: String, borrowed: String, expense: String) {
        self.loanRequest = BorrowingLoanRequest(expense: expense, income: income, borrowingNeed: borrowed)
    }
}
