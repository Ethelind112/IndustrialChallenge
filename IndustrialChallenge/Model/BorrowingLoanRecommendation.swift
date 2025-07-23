//
//  BorrowingLoanRecommendation.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import Foundation

class BorrowingLoanRecommendation: ObservableObject {
    var borrowingLoan: [BorrowingLoan]
    var borrowingLoanRequest: BorrowingLoanRequest
    var recommendationBorrowing: BorrowingLoan? {
        borrowingLoan.min(by: { $0.totalCicilan < $1.totalCicilan })
    }
    
    init(borrowingLoan: [BorrowingLoan], borrowingLoanRequest: BorrowingLoanRequest) {
        self.borrowingLoan = borrowingLoan
        self.borrowingLoanRequest = borrowingLoanRequest
    }
    
}
