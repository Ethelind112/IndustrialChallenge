//
//  GlobalVariable.swift
//  IndustrialChallenge
//
//  Created by Amanda on 23/07/25.
//

import Foundation

let maximumLimitPinjaman = "60000000"
let maximumLimitPinjamanInt = 60000000
let defaultBorrowingValue = "10000000"

let loanOptions = [
    LoanOption(tenorInMonths: 6, bungaRate: 0.2),
    LoanOption(tenorInMonths: 9, bungaRate: 0.3),
    LoanOption(tenorInMonths: 12, bungaRate: 0.4)
]

func formatToRupiahStyle(_ input: String) -> String {
    guard let number = Double(input) else { return input }

    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = "."
    formatter.decimalSeparator = "," // optional kalau kamu pakai desimal
    formatter.locale = Locale(identifier: "id_ID")
    formatter.maximumFractionDigits = 0

    return formatter.string(from: NSNumber(value: number)) ?? input
}

func cleanCurrencyString(_ value: String) -> Double? {
    let cleaned = value.replacingOccurrences(of: ".", with: "")
    return Double(cleaned)
}
