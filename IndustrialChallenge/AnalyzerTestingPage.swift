//
//  AnalyzerTestingPage.swift
//  Challenge4Analyzer
//
//  Created by Ethelind Septiani Metta on 20/07/25.
//

import SwiftUI

struct AnalyzerTestingPage: View {
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
    
    
    @State var showSiPlinPinjam: Bool = true
    @State var showSiPlinPengeluaran: Bool = false
    @State var showSiPlinRekomendasi: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack{
                
                Button {
                    showAnalyzer = true
                }label: {
                    Text("Analyze")
                }
            }
            .navigationTitle("Halaman Pinjaman")
            .toolbarTitleDisplayMode(.inline)
            .padding()
            .sheet(isPresented: $showAnalyzer){
                
                if showSiPlinPinjam {
                    SiPlinIsiPinjaman(borrowed: $borrowed, showSiPlinPinjam: $showSiPlinPinjam, showSiPlinPengeluaran: $showSiPlinPengeluaran)
                } else if showSiPlinPengeluaran {
                    VStack {
                        VStack {
                            ZStack (alignment: .leading) {
                                VStack {
                                    Text("Isi Pengeluaranmu")
                                        .font(.body)
                                        .fontWeight(.bold)
                                    
                                    Text("SiPlin")
                                        .font(.caption)
                                        .foregroundColor(.gray)
//                                        .padding(.top, 0.5)
                                }
                                .frame(maxWidth: .infinity)
                                
                                Button {
                                    showSiPlinPinjam.toggle()
                                    showSiPlinPengeluaran.toggle()
                                }label: {
                                    Image(systemName: "arrow.left")
                                        .foregroundColor(.primaryGreen)
                                }
                            }
                            
                            Spacer()
                            
                            Text("Dengan tahu penghasilan dan pengeluaranmu, SiPlin bisa rekomendasiin jumlah pinjaman yang paling pas buat kamu.")
                                .font(.caption)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                
                            Spacer()
                            
                            VStack {
                                HStack {
                                    Text("Jumlah pinjaman yang diajukan")
                                    Spacer()
                                    Text("Rp \(borrowed)")
                                    Image(systemName: "pencil")
                                }
                                .font(.caption)
                                .padding(16)
                                .background(Color("AdditionalColorLightGray"))
                                .cornerRadius(13)
                                
                                HStack {
                                    Text("Pendapatan")
                                    Spacer()
                                    Text("Rp \(income)")
                                    Image(systemName: "pencil")
                                }
                                .font(.caption)
                                .padding(16)
                                .background(Color("AdditionalColorLightGray"))
                                .cornerRadius(13)
                            }
                            
                            Spacer()
                            
                            VStack (alignment: .leading) {
                                
                                HStack {
                                    Text("Pengeluaranmu per bulan berapa?")
                                        .fontWeight(.bold)
                                    
                                    Button {
                                        
                                    }label: {
                                        Image(systemName: "questionmark.circle")
                                            .foregroundColor(.toolTipBlue)
                                    }
                                }
                                .font(.callout)
                                
                                HStack {
                                    Text("Rp")
                                    
                                    TextField("Pengeluaran", text: $expenses)
                                }
                                .font(.title3)
                                .fontWeight(.bold)
                                
                                Rectangle()
                                    .frame(height: 1, alignment: .center)
                                    .foregroundColor(.primaryGreen)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 24)
                        }
                        .padding([.top, .horizontal], 20)
                        
                        Rectangle()
                            .frame(height: 1, alignment: .bottom)
                            .foregroundColor(Color(.lightGray))
                        
                        VStack {
                            
                            VStack {
                                
                                Grid(alignment: .center, horizontalSpacing: 50, verticalSpacing: 20){
                                    GridRow{
                                        constructButton(text: "1")
                                        
                                        constructButton(text: "2")
                                        
                                        constructButton(text: "3")
                                    }
                                    
                                    GridRow {
                                        constructButton(text: "4")
                                        
                                        constructButton(text: "5")
                                        
                                        constructButton(text: "6")
                                    }
                                    
                                    GridRow {
                                        constructButton(text: "7")
                                        
                                        constructButton(text: "8")
                                        
                                        constructButton(text: "9")
                                    }
                                    
                                    GridRow {
                                        constructButton(text: "0")
                                        
                                        constructButton(text: "000")
                                        
                                        Button {
                                            if expenses != ""{
                                                expenses.removeLast()
                                            }
                                        } label: {
                                            Image(systemName: "delete.left")
                                        }
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    }
                                }
                                
                                Button {
                                    showSiPlinPinjam.toggle()
                                    showSiPlinPengeluaran.toggle()
                                }label: {
                                    Text("Lanjut")
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 14)
                                        .background(.primaryGreen)
                                        .cornerRadius(14)
                                        .foregroundColor(.white)
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                    
                                }
                                .padding(.horizontal, 35)
                                .padding(.top, 30)
                            }
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .frame(height: 320)
                            
                        }
                        .padding(.vertical, 40)
                        .padding(.horizontal, 30)
                    }
                }
                
            }
            
        }
    }
    
    func constructButton(text: String) -> some View{
        Text(text)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .onTapGesture {
            expenses = expenses + text
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
            
            if !availableBorrow && sisaKeuangan ?? 0 >= totalBayar {
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

#Preview {
    AnalyzerTestingPage()
}

struct SiPlinIsiPinjaman: View {
    
    @Binding var borrowed: String
    @Binding var showSiPlinPinjam: Bool
    @Binding var showSiPlinPengeluaran: Bool
    
    var body: some View {
        VStack {
            HStack (alignment: .center) {
                Image("SiPlinLogo_Analyzer")
                    .padding(.trailing, 20)
                
                VStack (alignment: .leading){
                    Text("SiPlin")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Si Pintar Planning")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.primaryGreen)
                }
                
                Spacer()
                
            }
            .background{
                Image("HeaderBackground_Analyzer")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 20)
            
            VStack {
                Text("Langsung dapatkan jumlah pinjaman yang sesuai dengan kapabilitasmu!")
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                HStack {
                    Image("StatusBarIcon")
                    
                    Text("Ketahui SiPlin Disini")
                        .foregroundColor(.primaryGreen)
                        .font(.caption)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(
                    RadialGradient(
                        gradient: Gradient(colors: [
                            Color.white.opacity(0.5),
                            Color.additionalColorGreen.opacity(0.5)
                        ]),
                        center: UnitPoint(x: -0.0324, y: 1.1125),
                        startRadius: 0,
                        endRadius: 200
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 3.5))
                )
                .border(.primaryGreen, width: 0.44)
                .cornerRadius(3.5)
                
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("Mau Pinjam Berapa?")
                        .font(.caption)
                        .fontWeight(.bold)
                    
                    HStack {
                        Text("Rp")
                        
                        TextField("Jumlah Pinjaman", text: $borrowed)
                    }
                    .font(.title3)
                    .fontWeight(.bold)
                    
                    Rectangle()
                        .frame(height: 1, alignment: .bottom)
                        .foregroundColor(.primaryGreen)
                    
                    HStack {
                        Text("Maksimum Limit Pinjaman")
                        Spacer()
                        Text("Rp. 60.000.000")
                    }
                    .font(.caption)
                    
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            
            Rectangle()
                .frame(height: 1, alignment: .bottom)
                .foregroundColor(Color(.lightGray))
            
            Spacer()
            
            VStack {
                
                VStack {
                    
                    Grid(alignment: .center, horizontalSpacing: 50, verticalSpacing: 20){
                        GridRow{
                            constructButton(text: "1")
                            
                            constructButton(text: "2")
                            
                            constructButton(text: "3")
                        }
                        
                        GridRow {
                            constructButton(text: "4")
                            
                            constructButton(text: "5")
                            
                            constructButton(text: "6")
                        }
                        
                        GridRow {
                            constructButton(text: "7")
                            
                            constructButton(text: "8")
                            
                            constructButton(text: "9")
                        }
                        
                        GridRow {
                            constructButton(text: "0")
                            
                            constructButton(text: "000")
                            
                            Button {
                                if borrowed != ""{
                                    borrowed.removeLast()
                                }
                            } label: {
                                Image(systemName: "delete.left")
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                    
                    Button {
                        showSiPlinPinjam.toggle()
                        showSiPlinPengeluaran.toggle()
                    }label: {
                        Text("Lanjut")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(.primaryGreen)
                            .cornerRadius(14)
                            .foregroundColor(.white)
                            .font(.footnote)
                            .fontWeight(.bold)
                        
                    }
                    .padding(.horizontal, 35)
                    .padding(.top, 30)
                }
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(height: 320)
                
            }
            .padding(.vertical, 40)
            .padding(.horizontal, 30)
            
            Spacer()
            
        }
    }
    
    func constructButton(text: String) -> some View{
        Text(text)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .onTapGesture {
            borrowed = borrowed + text
        }
    }
}
