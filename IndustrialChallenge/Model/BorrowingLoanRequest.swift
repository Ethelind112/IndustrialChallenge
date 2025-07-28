//
//  BorrowingLoanRequest.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import Foundation
import SwiftData

@Model
class BorrowingLoanRequest: ObservableObject {
    var expense: String
    var income: String
    var borrowingNeed: String
    var createdAt: Date
    
    var expenseValue: Double {
        Double(expense.formatWithoutDot()) ?? 0
    }
    
    var incomeValue: Double {
        Double(income.formatWithoutDot()) ?? 0
    }
    
    var borrowingNeedValue: Double {
        Double(borrowingNeed.formatWithoutDot()) ?? 0
    }
    
    var deficit: Bool {
        expenseValue > incomeValue
    }
    
    init(expense: String, income: String, borrowingNeed: String) {
        self.expense = expense
        self.income = income
        self.borrowingNeed = borrowingNeed
        self.createdAt = Date()
    }
}
