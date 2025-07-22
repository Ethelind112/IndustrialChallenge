//
//  BorrowingLoanRecommendation.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import Foundation

class BorrowingLoanRecommendation {
    var borrowingLoan: [BorrowingLoan]
    var borrowingLoanRequest: BorrowingLoanRequest
    var recommendationBorrowing: BorrowingLoan
    
    init(borrowingLoan: [BorrowingLoan], borrowingLoanRequest: BorrowingLoanRequest, recommendationBorrowing: BorrowingLoan) {
        self.borrowingLoan = borrowingLoan
        self.borrowingLoanRequest = borrowingLoanRequest
        self.recommendationBorrowing = recommendationBorrowing
    }
}
