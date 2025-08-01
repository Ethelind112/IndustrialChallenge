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
    @State var showToast = false
    @State var showToast2 = false
    @State var showToast3 = false
    @State var isError = false
    

    
    var body: some View {
        NavigationView {
            
            ZStack (alignment: .top) {
                
                if showToast2 {
                    ToastView(type: .warning, message: "Nominal pinjaman tidak mencapai batas minimum!")
                        .transition(.move(edge: .top).combined(with: .opacity))
                        .zIndex(999)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                withAnimation {
                                    showToast = false
                                }
                            }
                        }
                }
                if showToast3{
                    ToastView(type: .warning, message: "Pengeluaran tidak boleh sama dengan pendapatan!")
                            .transition(.move(edge: .top).combined(with: .opacity))
                            .zIndex(999)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                    withAnimation {
                                        showToast = false
                                    }
                                }
                            }
                }
                
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
                        
                        IsiPengeluaran(viewModel: viewModel, computation: $computation, isError: $isError)
                    }
                    .padding([.top, .horizontal], 20)
                    
                    Rectangle()
                        .frame(height: 1, alignment: .bottom)
                        .foregroundColor(Color("AdditionalColorLightGray"))
                    
                    VStack {
                        
                        VStack {
                            
                            Calculator(inputs: $viewModel.loanRequest.expense, computation: $computation)
                                .padding(.horizontal, 20)
                            
                            Button {
                                if !isError {
                                    let income = Int(viewModel.income.formatWithoutDot()) ?? 0
                                    let expense = Int(viewModel.expense.formatWithoutDot()) ?? 0
                                    print(income)
                                    print(expense)
                                    
                                    if expense == income {
                                        withAnimation {
                                            showToast3 = true
                                        }
                                    }else{
                                        currSiPlinStep = .siPlinRecommendation
                                    }
                                    
                                }
                                
                            } label: {
                                
                                if isError {
                                    LanjutButton(textColor: .gray, backgroundColor: .additionalColorLightGray)
                                        .padding(.top, 30)
                                } else {
                                    LanjutButton(textColor: .white, backgroundColor: .primaryGreen)
                                        .padding(.top, 30)
                                }
                                
                                
                            }
    //                        .padding(.top, 1)
                        }
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(height: 300)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 40)
                    
                }
                .onAppear {
                    isError = Int(viewModel.expense.formatWithoutDot()) ?? 0 < 0
                }
                .onAppear {
                    let income = Int(viewModel.income.formatWithoutDot()) ?? 0
                    let expense = Int(viewModel.expense.formatWithoutDot()) ?? 0
                    isError = expense < 0 || expense == income
                }
                .onChange(of: viewModel.expense) {
                    isError = Int(viewModel.expense.formatWithoutDot()) ?? 0 < 0
                    
                    if isError {
                        showToast = true
                    }
                }
                .onChange(of: showToast) {
                    showToast2 = showToast
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var currSiPlinStep = SiPlinStep.siPlinBorrowing
    
    @Previewable @StateObject var viewModel: SiPlinController = SiPlinController(income: "10000000", borrowed: "9000000", expense: "4000000")
    
    ExpenseSheet(viewModel: viewModel, currSiPlinStep: $currSiPlinStep)
}
