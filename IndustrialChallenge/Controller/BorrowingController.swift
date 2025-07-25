//
//  BorrowingController.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//

import Foundation
class BorrowingController {
    func hitungPinjaman(jumlahDiterima: Double, option: LoanOption) -> BorrowingLoan {
        
        let bungaRate = option.bungaRate
        let durasi = option.tenorInMonths
        let biayaLayananPersen = 0.1 // 10%
        let ppnPersen = 0.043 // 4.3%
        
        var totalBunga = jumlahDiterima * bungaRate/100  * Double(durasi) * 30
        
        if totalBunga > jumlahDiterima {
            totalBunga = jumlahDiterima
        }
        
        print("Bunga : \(totalBunga)")
        
        let biayaLayanan = jumlahDiterima * biayaLayananPersen
        let ppn = jumlahDiterima * ppnPersen
        
        let totalCicilan = jumlahDiterima + totalBunga + biayaLayanan + ppn
        let cicilanPerBulan = totalCicilan / Double(option.tenorInMonths)
        
    
        return BorrowingLoan(
            tenor: option.tenorInMonths,
                cicilanPerBulan: String(format: "%.2f", cicilanPerBulan),
                totalCicilan: String(format: "%.2f", totalCicilan),
                jumlahDiterima: String(format: "%.2f", jumlahDiterima),
                bunga: String(format: "%.2f", totalBunga),
                biayaLayanan: String(format: "%.2f", biayaLayanan),
                PPn: String(format: "%.2f", ppn)
        )
    }
}
