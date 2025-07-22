//
//  BorrowingLoan.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import Foundation

class BorrowingLoan {
    var tenor: Int
    var cicilanPerBulan: Double
    var totalCicilan: Double
    var jumlahDiterima: Double
    var bunga: Double
    var biayaLayanan: Double
    var PPn: Double
    
    init(tenor: Int, cicilanPerBulan: Double, totalCicilan: Double, jumlahDiterima: Double, bunga: Double, biayaLayanan: Double, PPn: Double) {
        self.tenor = tenor
        self.cicilanPerBulan = cicilanPerBulan
        self.totalCicilan = totalCicilan
        self.jumlahDiterima = jumlahDiterima
        self.bunga = bunga
        self.biayaLayanan = biayaLayanan
        self.PPn = PPn
    }
}
