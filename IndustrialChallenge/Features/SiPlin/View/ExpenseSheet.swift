//
//  ExpenseSheet.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import SwiftUI

struct ExpenseSheet: View {
    
    @ObservedObject var viewModel: SiPlinController
    @Binding var currSiPlinStep: SiPlinStep
    @State var computation: String = ""
    
    var body: some View {
        NavigationView {
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
                            currSiPlinStep = .siPlinBorrowing
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
                            Text("Rp \(viewModel.borrowed)")
                            Image(systemName: "pencil")
                        }
                        .font(.caption)
                        .padding(16)
                        .background(Color("AdditionalColorLightGray"))
                        .cornerRadius(13)
                        
                        HStack {
                            Text("Pendapatan")
                            Spacer()
                            Text("Rp \(viewModel.income)")
                            Image(systemName: "pencil")
                        }
                        .font(.caption)
                        .padding(16)
                        .background(Color("AdditionalColorLightGray"))
                        .cornerRadius(13)
                    }
                    
                    Spacer()
                    
                    VStack (alignment: .leading) {
                        
                        
                        Text("Pengeluaranmu per bulan berapa?")
                            .fontWeight(.bold)
                            .font(.callout)
                        
                        Text(computation)
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        HStack {
                            Text("Rp")
                            
                            TextField("Pengeluaran", text: $viewModel.expense)
                                .disabled(true)
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
                        
                        Calculator(inputs: $viewModel.expense, computation: $computation)
                        
                        Button {
                          
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
                    .frame(height: 300)
                    
                }
                .padding(.vertical, 40)
                .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    @Previewable @State var currSiPlinStep = SiPlinStep.siPlinBorrowing
    
    @Previewable @StateObject var viewModel: SiPlinController = SiPlinController(income: "10000000", borrowed: "9000000", expense: "4000000")
    
    ExpenseSheet(viewModel: viewModel, currSiPlinStep: $currSiPlinStep)
}
