//
//  RecommendationCalculation.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 23/07/25.
//

import Foundation

class RecommendationCalculation {
    func calculateResult(loanRequest: BorrowingLoanRequest) -> (BorrowingLoanRecommendation, Bool){
        
        let leftOver = loanRequest.incomeValue - loanRequest.expenseValue
        let (inputResult, surplusNegative) = calculateCicilanUserInput(budget: Double(loanRequest.borrowingNeedValue), leftOver: leftOver, surplusNegative: false)
        var deficitResult: [BorrowingLoan] = []
        
        if loanRequest.deficit {
            (deficitResult, _) = calculateCicilanUserInput(budget: abs(Double(leftOver)), leftOver: leftOver, surplusNegative: true)
        } else if surplusNegative {
            deficitResult = calculateCicilanDeficit(budget: Double(leftOver), leftOver: leftOver)
        }
        
        return (BorrowingLoanRecommendation(borrowingLoan: deficitResult + inputResult, borrowingLoanRequest: loanRequest), surplusNegative)
        
    }
    
    func calculateCicilanUserInput(budget: Double, leftOver: Double, surplusNegative: Bool) -> ([BorrowingLoan], Bool) {
        
        var resultNegative: [BorrowingLoan] = []
        var surplusNegativeChecker: Bool = surplusNegative
        
        //        6 bulan
        let biayaLayanan6 = budget*0.1
        let PPn6 = budget*0.043
        var bungaTotal6 = budget*0.002*6*30
        
        if bungaTotal6 > budget {
            bungaTotal6 = budget
        }
        
        let totalBayar6 = budget + bungaTotal6 + biayaLayanan6 + PPn6
        let cicilanPerBulan6 = totalBayar6/6
        
        resultNegative.append(BorrowingLoan(tenor: 6, cicilanPerBulan: String(format: "%.2f", cicilanPerBulan6).formatToRupiahStyle(), totalCicilan: String(format: "%.2f", totalBayar6).formatToRupiahStyle(), jumlahDiterima: String(format: "%.2f", budget).formatToRupiahStyle(), bunga: String(format: "%.2f", bungaTotal6).formatToRupiahStyle(), biayaLayanan: String(format: "%.2f", biayaLayanan6).formatToRupiahStyle(), PPn: String(format: "%.2f", PPn6).formatToRupiahStyle()))
        
        //        9 bulan
        let biayaLayanan9 = budget*0.1
        let PPn9 = budget*0.043
        var bungaTotal9 = budget*0.003*9*30
        
        if bungaTotal9 > budget {
            bungaTotal9 = budget
        }
        
        let totalBayar9 = budget + bungaTotal9 + biayaLayanan9 + PPn9
        let cicilanPerBulan9 = totalBayar9/9
        
        resultNegative.append(BorrowingLoan(tenor: 9, cicilanPerBulan: String(format: "%.2f", cicilanPerBulan9).formatToRupiahStyle(), totalCicilan: String(format: "%.2f", totalBayar9).formatToRupiahStyle(), jumlahDiterima: String(format: "%.2f", budget).formatToRupiahStyle(), bunga: String(format: "%.2f", bungaTotal9).formatToRupiahStyle(), biayaLayanan: String(format: "%.2f", biayaLayanan9), PPn: String(format: "%.2f", PPn9).formatToRupiahStyle()))
        
//        12 bulan
        let biayaLayanan12 = budget*0.1
        let PPn12 = budget*0.043
        var bungaTotal12 = budget*0.004*12*30
        
        if bungaTotal12 > budget {
            bungaTotal12 = budget
        }
        
        let totalBayar12 = budget + bungaTotal12 + biayaLayanan12 + PPn12
        let cicilanPerBulan12 = totalBayar12/12
        
        resultNegative.append(BorrowingLoan(tenor: 12, cicilanPerBulan: String(format: "%.2f", cicilanPerBulan12).formatToRupiahStyle(), totalCicilan: String(format: "%.2f", totalBayar12).formatToRupiahStyle(), jumlahDiterima: String(format: "%.2f", budget).formatToRupiahStyle(), bunga: String(format: "%.2f", bungaTotal12).formatToRupiahStyle(), biayaLayanan: String(format: "%.2f", biayaLayanan12).formatToRupiahStyle(), PPn: String(format: "%.2f", PPn12).formatToRupiahStyle()))
        
        if !surplusNegativeChecker && (cicilanPerBulan6 > leftOver || cicilanPerBulan9 > leftOver || cicilanPerBulan12 > leftOver) {
            surplusNegativeChecker = true
        }
        
        return (resultNegative, surplusNegativeChecker)
    }
    
    func calculateCicilanDeficit(budget: Double, leftOver: Double) -> [BorrowingLoan] {
        var resultNegative: [BorrowingLoan] = []
        
        //        6 bulan
        var pinjaman6Bulan = (budget * 6) / (1 + min(0.002*6*30, 1) + 0.1 + 0.043)
        pinjaman6Bulan = Double(floor(pinjaman6Bulan / 100000) * 100000)
        
        let biayaLayanan6 = pinjaman6Bulan*0.1
        let PPn6 = pinjaman6Bulan*0.043
        var bungaTotal6 = pinjaman6Bulan*0.002*6*30
        
        if bungaTotal6 > pinjaman6Bulan {
            bungaTotal6 = pinjaman6Bulan
        }
        
        let totalBayar6 = pinjaman6Bulan + bungaTotal6 + biayaLayanan6 + PPn6
        let cicilanPerBulan6 = Int(totalBayar6/6)
        
        resultNegative.append(BorrowingLoan(tenor: 6, cicilanPerBulan: String(Int(cicilanPerBulan6)).formatToRupiahStyle(), totalCicilan: String(Int(totalBayar6)).formatToRupiahStyle(), jumlahDiterima: String(Int(pinjaman6Bulan)).formatToRupiahStyle(), bunga: String(Int(bungaTotal6)).formatToRupiahStyle(), biayaLayanan: String(Int(biayaLayanan6)).formatToRupiahStyle(), PPn: String(Int(PPn6)).formatToRupiahStyle()))
        
        //        9 bulan
        var pinjaman9Bulan = (budget * 9) / (1 + min(0.003*9*30, 1) + 0.1 + 0.043)
        pinjaman9Bulan = Double(floor(pinjaman9Bulan / 100000) * 100000)
        
        let biayaLayanan9 = pinjaman9Bulan*0.1
        let PPn9 = pinjaman9Bulan*0.043
        var bungaTotal9 = pinjaman9Bulan*0.003*9*30
        
        if bungaTotal9 > pinjaman9Bulan {
            bungaTotal9 = pinjaman9Bulan
        }
        
        let totalBayar9 = pinjaman9Bulan + bungaTotal9 + biayaLayanan9 + PPn9
        let cicilanPerBulan9 = Int(totalBayar9/9)
        
        resultNegative.append(BorrowingLoan(tenor: 9, cicilanPerBulan: String(Int(cicilanPerBulan9)).formatToRupiahStyle(), totalCicilan: String(Int(totalBayar9)).formatToRupiahStyle(), jumlahDiterima: String(Int(pinjaman9Bulan)).formatToRupiahStyle(), bunga: String(Int(bungaTotal9)).formatToRupiahStyle(), biayaLayanan: String(Int(biayaLayanan9)), PPn: String(Int(PPn9)).formatToRupiahStyle()))
        
//        12 bulan
        var pinjaman12Bulan = (budget * 12) / (1 + min(0.004*12*30, 1) + 0.1 + 0.043)
        pinjaman12Bulan = Double(floor(pinjaman12Bulan / 100000) * 100000)
        
        let biayaLayanan12 = pinjaman12Bulan*0.1
        let PPn12 = pinjaman12Bulan*0.043
        var bungaTotal12 = pinjaman12Bulan*0.004*12*30
        
        if bungaTotal12 > pinjaman12Bulan {
            bungaTotal12 = pinjaman12Bulan
        }
        
        let totalBayar12 = pinjaman12Bulan + bungaTotal12 + biayaLayanan12 + PPn12
        let cicilanPerBulan12 = Int(totalBayar12/12)

        resultNegative.append(BorrowingLoan(tenor: 12, cicilanPerBulan: String(Int(cicilanPerBulan12)).formatToRupiahStyle(), totalCicilan: String(Int(totalBayar12)).formatToRupiahStyle(), jumlahDiterima: String(Int(pinjaman12Bulan)).formatToRupiahStyle(), bunga: String(Int(bungaTotal12)).formatToRupiahStyle(), biayaLayanan: String(Int(biayaLayanan12)).formatToRupiahStyle(), PPn: String(Int(PPn12)).formatToRupiahStyle()))
        
        return resultNegative
    }
}
