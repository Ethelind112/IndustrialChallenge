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
                    
                    HeaderExpense(currSiPlinStep: $currSiPlinStep, title: "Isi Pengeluaranmu")
                    
                    Spacer()
                    
                    Text("Dengan tahu penghasilan dan pengeluaranmu, SiPlin bisa rekomendasiin jumlah pinjaman yang paling pas buat kamu.")
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        
                    Spacer()
                    
                    DetailExpense(viewModel: viewModel)
                    
                    Spacer()
                    
                    IsiPengeluaran(viewModel: viewModel, computation: $computation)
                }
                .padding([.top, .horizontal], 20)
                
                Rectangle()
                    .frame(height: 1, alignment: .bottom)
                    .foregroundColor(Color("AdditionalColorLightGray"))
                
                VStack {
                    
                    VStack {
                        
                        Calculator(inputs: $viewModel.expense, computation: $computation)
                            .padding(.horizontal, 30)
                        
                        Button {
                            currSiPlinStep = .siPlinRecommendation
                        } label: {
                            LanjutButton()
                                .padding(.top, 30)
                        }
//                        .padding(.top, 1)
                    }
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(height: 300)
                }
                .padding(.vertical, 40)
                
            }
        }
    }
}

#Preview {
    @Previewable @State var currSiPlinStep = SiPlinStep.siPlinBorrowing
    
    @Previewable @StateObject var viewModel: SiPlinController = SiPlinController(income: "10000000", borrowed: "9000000", expense: "4000000")
    
    ExpenseSheet(viewModel: viewModel, currSiPlinStep: $currSiPlinStep)
}
