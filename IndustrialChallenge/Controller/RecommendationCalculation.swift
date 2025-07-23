//
//  RecommendationCalculation.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 23/07/25.
//

import Foundation

class RecommendationCalculation {
    func calculateResult(loanRequest: BorrowingLoanRequest) -> (BorrowingLoanRecommendation, Bool){
        
        let leftOver = Int(loanRequest.incomeValue - loanRequest.expenseValue)
        let (inputResult, surplusNegative) = calculateCicilanUserInput(budget: Double(loanRequest.borrowingNeedValue), leftOver: leftOver, surplusNegative: false)
        var deficitResult: [BorrowingLoan] = []
        
        if loanRequest.deficit {
            deficitResult = calculateCicilanDeficit(budget: abs(Double(leftOver)), leftOver: leftOver)
        } else if surplusNegative {
            deficitResult = calculateCicilanDeficit(budget: Double(leftOver), leftOver: leftOver)
        }
        
        return (BorrowingLoanRecommendation(borrowingLoan: inputResult + deficitResult, borrowingLoanRequest: loanRequest), surplusNegative)
        
    }
    
    func calculateCicilanUserInput(budget: Double, leftOver: Int, surplusNegative: Bool) -> ([BorrowingLoan], Bool) {
        
        var resultNegative: [BorrowingLoan] = []
        var surplusNegativeChecker: Bool = surplusNegative
        
        //        6 bulan
        let biayaLayanan6 = budget*0.1
        let PPn6 = budget*0.043
        var bungaTotal6 = budget*0.002*6*30
        let totalBayar6 = Int(budget) + Int(bungaTotal6) + Int(biayaLayanan6) + Int(PPn6)
        let cicilanPerBulan6 = totalBayar6/6
        
        if bungaTotal6 > budget {
            bungaTotal6 = budget
        }
        
        resultNegative.append(BorrowingLoan(tenor: 6, cicilanPerBulan: String(Int(cicilanPerBulan6)).formatToRupiahStyle(), totalCicilan: String(Int(totalBayar6)).formatToRupiahStyle(), jumlahDiterima: String(Int(budget)).formatToRupiahStyle(), bunga: String(Int(bungaTotal6)).formatToRupiahStyle(), biayaLayanan: String(Int(biayaLayanan6)).formatToRupiahStyle(), PPn: String(Int(PPn6)).formatToRupiahStyle()))
        
        //        9 bulan
        let biayaLayanan9 = budget*0.1
        let PPn9 = budget*0.043
        var bungaTotal9 = budget*0.003*9*30
        let totalBayar9 = Int(budget) + Int(bungaTotal9) + Int(biayaLayanan9) + Int(PPn9)
        let cicilanPerBulan9 = totalBayar9/9
        
        if bungaTotal9 > budget {
            bungaTotal9 = budget
        }
        
        resultNegative.append(BorrowingLoan(tenor: 9, cicilanPerBulan: String(Int(cicilanPerBulan9)).formatToRupiahStyle(), totalCicilan: String(Int(totalBayar9)).formatToRupiahStyle(), jumlahDiterima: String(Int(budget)).formatToRupiahStyle(), bunga: String(Int(bungaTotal9)).formatToRupiahStyle(), biayaLayanan: String(Int(biayaLayanan9)), PPn: String(Int(PPn9)).formatToRupiahStyle()))
        
//        12 bulan
        let biayaLayanan12 = budget*0.1
        let PPn12 = budget*0.043
        var bungaTotal12 = budget*0.004*12*30
        let totalBayar12 = Int(budget) + Int(bungaTotal12) + Int(biayaLayanan12) + Int(PPn12)
        let cicilanPerBulan12 = totalBayar12/12
        
        if bungaTotal12 > budget {
            bungaTotal12 = budget
        }
        
        resultNegative.append(BorrowingLoan(tenor: 12, cicilanPerBulan: String(Int(cicilanPerBulan12)).formatToRupiahStyle(), totalCicilan: String(Int(totalBayar12)).formatToRupiahStyle(), jumlahDiterima: String(Int(budget)).formatToRupiahStyle(), bunga: String(Int(bungaTotal12)).formatToRupiahStyle(), biayaLayanan: String(Int(biayaLayanan12)).formatToRupiahStyle(), PPn: String(Int(PPn12)).formatToRupiahStyle()))
        
        if !surplusNegativeChecker && (cicilanPerBulan6 > leftOver || cicilanPerBulan9 > leftOver || cicilanPerBulan12 > leftOver) {
            surplusNegativeChecker = true
        }
        
        return (resultNegative, surplusNegative)
    }
    
    func calculateCicilanDeficit(budget: Double, leftOver: Int) -> [BorrowingLoan] {
        var resultNegative: [BorrowingLoan] = []
        
        //        6 bulan
        let pinjaman6Bulan = (budget * 6) / (1 + 0.002*6*30 + 0.1 + 0.043)
        
        let biayaLayanan6 = pinjaman6Bulan*0.1
        let PPn6 = pinjaman6Bulan*0.043
        var bungaTotal6 = pinjaman6Bulan*0.002*6*30
        let cicilanPerBulan6 = Int(bungaTotal6/6)
        
        if bungaTotal6 > budget {
            bungaTotal6 = budget
        }
        
        resultNegative.append(BorrowingLoan(tenor: 6, cicilanPerBulan: String(Int(cicilanPerBulan6)).formatToRupiahStyle(), totalCicilan: String(Int(budget)).formatToRupiahStyle(), jumlahDiterima: String(Int(pinjaman6Bulan)).formatToRupiahStyle(), bunga: String(Int(bungaTotal6)).formatToRupiahStyle(), biayaLayanan: String(Int(biayaLayanan6)).formatToRupiahStyle(), PPn: String(Int(PPn6)).formatToRupiahStyle()))
        
        //        9 bulan
        let pinjaman9Bulan = (budget * 9) / (1 + 0.001*9*30 + 0.1 + 0.043)
        
        let biayaLayanan9 = pinjaman9Bulan*0.1
        let PPn9 = pinjaman6Bulan*0.043
        var bungaTotal9 = pinjaman6Bulan*0.003*9*30
        let cicilanPerBulan9 = Int(bungaTotal9/9)
        
        if bungaTotal9 > budget {
            bungaTotal9 = budget
        }
        
        resultNegative.append(BorrowingLoan(tenor: 9, cicilanPerBulan: String(Int(cicilanPerBulan9)).formatToRupiahStyle(), totalCicilan: String(Int(budget)).formatToRupiahStyle(), jumlahDiterima: String(Int(pinjaman9Bulan)).formatToRupiahStyle(), bunga: String(Int(bungaTotal9)).formatToRupiahStyle(), biayaLayanan: String(Int(biayaLayanan9)), PPn: String(Int(PPn9)).formatToRupiahStyle()))
        
//        12 bulan
        let pinjaman12Bulan = (budget * 12) / (1 + 0.004*12*30 + 0.1 + 0.043)
        
        let biayaLayanan12 = pinjaman6Bulan*0.1
        let PPn12 = pinjaman6Bulan*0.043
        var bungaTotal12 = pinjaman6Bulan*0.004*12*30
        let cicilanPerBulan12 = Int(bungaTotal12/12)
        
        if bungaTotal12 > budget {
            bungaTotal12 = budget
        }
        
        resultNegative.append(BorrowingLoan(tenor: 12, cicilanPerBulan: String(Int(cicilanPerBulan12)).formatToRupiahStyle(), totalCicilan: String(Int(budget)).formatToRupiahStyle(), jumlahDiterima: String(Int(pinjaman12Bulan)).formatToRupiahStyle(), bunga: String(Int(bungaTotal12)).formatToRupiahStyle(), biayaLayanan: String(Int(biayaLayanan12)).formatToRupiahStyle(), PPn: String(Int(PPn12)).formatToRupiahStyle()))
        
        return resultNegative
    }
}
