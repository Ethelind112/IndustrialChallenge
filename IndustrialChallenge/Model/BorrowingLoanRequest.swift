//
//  BorrowingLoanRequest.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import Foundation

class BorrowingLoanRequest {
    var expense: Double
    var income: Double
    var borrowingNeed: Double
    var deficit: Bool {
        expense > income
    }
    
    init(expense: Double, income: Double, borrowingNeed: Double) {
        self.expense = expense
        self.income = income
        self.borrowingNeed = borrowingNeed
    }
}
