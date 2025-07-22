//
//  BorrowingLoanProposal.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import Foundation

class BorrowingLoanProposal: ObservableObject {
    var borrowingLoan: BorrowingLoan
    var bank: String
    var tujuanPeminjaman: String
    
    init(borrowingLoan: BorrowingLoan, bank: String, tujuanPeminjaman: String) {
        self.borrowingLoan = borrowingLoan
        self.bank = bank
        self.tujuanPeminjaman = tujuanPeminjaman
    }
}
