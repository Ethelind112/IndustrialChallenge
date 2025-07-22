//
//  BorrowingLoanRequest.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import Foundation

class BorrowingLoanRequest {
    var expense: String
    var income: String
    var borrowingNeed: String
    
    var expenseValue: Double {
        Double(expense) ?? 0
    }
    
    var incomeValue: Double {
        Double(income) ?? 0
    }
    
    var borrowingNeedValue: Double {
        Double(borrowingNeed) ?? 0
    }
    
    var deficit: Bool {
        expenseValue > incomeValue
    }
    
    init(expense: String, income: String, borrowingNeed: String) {
        self.expense = expense
        self.income = income
        self.borrowingNeed = borrowingNeed
    }
}
