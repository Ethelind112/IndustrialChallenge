//
//  BungaRate.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import Foundation

enum BungaRate: Double {
    case tigaBulan = 0.1
    case enamBulan = 0.2
    case sembilanBulan = 0.3
    case duaBelasBulan = 0.4
}

struct LoanOption : Equatable {
    let tenorInMonths: Int
    let bungaRate: Double
}

let options = [
    LoanOption(tenorInMonths: 3, bungaRate: 0.01),
    LoanOption(tenorInMonths: 6, bungaRate: 0.02),
    LoanOption(tenorInMonths: 9, bungaRate: 0.03),
    LoanOption(tenorInMonths: 12, bungaRate: 0.04),
]
