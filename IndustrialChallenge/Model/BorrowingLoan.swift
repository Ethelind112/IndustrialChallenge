//
//  BorrowingLoan.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import Foundation

class BorrowingLoan: ObservableObject, Identifiable {
    var id: UUID
    var tenor: Int
    var cicilanPerBulan: String
    var totalCicilan: String
    var jumlahDiterima: String
    var bunga: String
    var biayaLayanan: String
    var PPn: String
    
    var cicilanPerBulanValue: Double {
//        Double(cicilanPerBulan.replacingOccurrences(of: ",", with: "")) ?? 0
        Double(cicilanPerBulan) ?? 0
    }
    
    var totalCicilanValue: Double {
        Double(totalCicilan) ?? 0
    }
    
    var jumlahDiterimaValue: Double {
        Double(jumlahDiterima) ?? 0
    }
    
    var bungaValue: Double {
        Double(bunga) ?? 0
    }
    
    var biayaLayananValue: Double {
        Double(biayaLayanan) ?? 0
    }
    
    var PPnValue: Double {
        Double(PPn) ?? 0
    }
    
    
    init(tenor: Int, cicilanPerBulan: String, totalCicilan: String, jumlahDiterima: String, bunga: String, biayaLayanan: String, PPn: String) {
        self.id = UUID()
        self.tenor = tenor
        self.cicilanPerBulan = cicilanPerBulan
        self.totalCicilan = totalCicilan
        self.jumlahDiterima = jumlahDiterima
        self.bunga = bunga
        self.biayaLayanan = biayaLayanan
        self.PPn = PPn
    }
    
}
