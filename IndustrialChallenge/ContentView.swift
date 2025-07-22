//
//  ContentView.swift
//  Challenge4Analyzer
//
//  Created by Ethelind Septiani Metta on 19/07/25.
//

import SwiftUI

struct ContentView: View {
    @State var showAnalyzer = false
    
    @State var expenses:String = ""
    @State var borrowed:String = "9000000"
    @State var biayaLayanan:Double = 0
    @State var PPn:Double = 0
    @State var resultBasedInput: resultAnalyzer?
    @State var resultDeficit: resultAnalyzer?
    @State var resultNegative: [pinjaman]?
    let income = 9000000
    @State var sisaKeuangan: Double?
    @State var showResultInput = false
    @State var showDeficit = false
    @State var availableBorrow = false
    
    var body: some View {
        NavigationStack {
            VStack{
                TextField("Borrow Amount", text: $borrowed)
                TextField("Expense", text: $expenses)
                
                Button {
                    showDeficit = false
                    showResultInput = false
                    availableBorrow = false
                    
                    if expenses != "" && borrowed != "" {
                        sisaKeuangan = Double(income) - (Double(expenses) ?? 0.0)
                        
                        resultBasedInput = calculateUserInput(borrowed: Double(borrowed) ?? 0)
                        
                        if let leftOver = sisaKeuangan {
                            if leftOver < 0 {
                                showDeficit = true
                                resultDeficit = calculateUserInput(borrowed: abs(leftOver))
                            }
                            else if !availableBorrow {
                                print(leftOver)
                                resultNegative = calculateNonDeficitNegative(budget: leftOver)
                            }
                        }
                    }
                    
                }label: {
                    Text("Analyze")
                }
                
                if showResultInput {
                    if let allCicilan = resultBasedInput?.cicilan {
                        HStack {
                            Text("Tenor")
                            Spacer()
                            Text("Cicilan")
                        }
                        ForEach(allCicilan) { c in
                            HStack {
                                Text(String(c.tenor))
                                Spacer()
                                Text(String(c.cicilan))
                            }
                        }
                    }
                }
                
                if showDeficit {
                    if let allDeficitCicilan = resultDeficit?.cicilan {
                        
                        HStack {
                            Text("Tenor")
                            Spacer()
                            Text("Cicilan")
                        }
                        ForEach(allDeficitCicilan) { c in
                            HStack {
                                Text(String(c.tenor))
                                Spacer()
                                Text(String(c.cicilan))
                            }
                        }
                    }
                } else if !availableBorrow {
                    //                calculateNonDeficitNegative
                    
                    if let allDeficitCicilan = resultNegative{
                        HStack {
                            Text("Total Pinjaman")
                            Spacer()
                            Text("Biaya Layanan")
                        }
                        ForEach(allDeficitCicilan) { c in
                            HStack {
                                Text(String(c.totalPinjaman))
                                Spacer()
                                Text(String(c.biayaLayanan))
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 22)
            }
    }
    
    func calculateUserInput(borrowed: Double) -> resultAnalyzer {
        showResultInput = true
        var tenor: [Int] = []
        var bunga:[Double] = []
        var biayaLayanan: Double = 0
        var PPn: Double = 0
        
        if borrowed <= 10000000 {
            tenor = [3, 6]
            bunga = [0.001, 0.002]
        } else if borrowed > 10000000 && borrowed <= 50000000 {
            tenor = [3, 6, 9]
            bunga = [0.001, 0.002, 0.003]
        } else if borrowed > 50000000 {
            tenor = [6, 9, 12]
            bunga = [0.002, 0.003, 0.004]
        }
        
        biayaLayanan = borrowed * 0.1
        PPn = borrowed * 0.043
        
        return analyzerBasedOnInputs(tenor: tenor, bunga: bunga, borrowed: borrowed, biayaLayanan: biayaLayanan, PPn: PPn)
        
    }
    
    func calculateNonDeficitNegative(budget: Double) -> [pinjaman] {
        
        var resultNegative: [pinjaman] = []
        //        3 bulan
        var pinjaman3Bulan = (budget * 3) / (1 + 0.001*3*30 + 0.1 + 0.043)
        
        if pinjaman3Bulan <= 50000000 {
            let biayaLayanan = pinjaman3Bulan*0.1
            let PPn = pinjaman3Bulan*0.043
            let bungaTotal = pinjaman3Bulan*0.001*3*30
            let cicilanPerBulan = bungaTotal/3
            
            let totalBayar = pinjaman3Bulan + bungaTotal + biayaLayanan + PPn
            
            resultNegative.append(pinjaman(totalPinjaman: pinjaman3Bulan, biayaLayanan: biayaLayanan, PPn: PPn, totalYangDibayar: totalBayar, cicilanPerBulan: cicilanPerBulan))
        }
        
        //        6 bulan
        var pinjaman6Bulan = (budget * 6) / (1 + 0.001*6*30 + 0.1 + 0.043)
        
        let biayaLayanan = pinjaman6Bulan*0.2
        let PPn = pinjaman6Bulan*0.043
        let bungaTotal = pinjaman6Bulan*0.001*6*30
        let cicilanPerBulan = bungaTotal/6
        
        let totalBayar = pinjaman6Bulan + bungaTotal + biayaLayanan + PPn
        
        resultNegative.append(pinjaman(totalPinjaman: pinjaman6Bulan, biayaLayanan: biayaLayanan, PPn: PPn, totalYangDibayar: totalBayar, cicilanPerBulan: cicilanPerBulan))
        
        //        9 bulan
        var pinjaman9Bulan = (budget * 9) / (1 + 0.001*9*30 + 0.1 + 0.043)
        
        //        12 bulan
        var pinjaman12Bulan = (budget * 12) / (1 + 0.001*12*30 + 0.1 + 0.043)
        
        return resultNegative
    }
    
    func analyzerBasedOnInputs(tenor: [Int], bunga:[Double], borrowed: Double, biayaLayanan: Double, PPn: Double) -> resultAnalyzer {
        
        var allCicilan: [cicilanPerBulan] = []
        
        for i in 0..<tenor.count {
            
            let bungaTotal = borrowed*bunga[i]*Double(tenor[i])*30
            
            let totalBayar = borrowed + bungaTotal + biayaLayanan + PPn
            
            let cicilan = totalBayar / Double(tenor[i])
            
            let resultTenor = cicilanPerBulan(tenor: tenor[i], cicilan: cicilan)
            
            allCicilan.append(resultTenor)
            
            if !availableBorrow && sisaKeuangan ?? 0 >= cicilan {
                availableBorrow = true
            }
        }
        
        var recommendation:resultAnalyzer = resultAnalyzer(cicilan: allCicilan, rekomendasi: [:])
        
        if let lowest = allCicilan.min(by: { $0.cicilan < $1.cicilan }) {
            recommendation.rekomendasi = [lowest.tenor: lowest.cicilan]
        }
        
        return recommendation
    }
}

struct resultAnalyzer {
    var cicilan:[cicilanPerBulan]
    var rekomendasi: [Int: Double]
}

struct cicilanPerBulan: Identifiable {
    var id: Int{tenor}
    var tenor: Int
    var cicilan: Double
}

struct pinjaman: Identifiable{
    var id: UUID = UUID()
    var totalPinjaman: Double
    var biayaLayanan: Double
    var PPn: Double
    var totalYangDibayar: Double
    var cicilanPerBulan: Double
}

#Preview {
    ContentView()
}
