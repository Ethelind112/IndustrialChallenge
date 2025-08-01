//
//  BorrowingView.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//
import SwiftUI

struct BorrowingView: View {
    @State private var showJumlahPinjamanTooltipModal = false
    @State private var showMaksimumLimitTooltipModal = false
    @State private var showDurasiTenorTooltipModal = false
    @State private var showCicilanTooltipModal = false
    @State private var jumlahPinjaman: String = defaultBorrowingValue
    @State private var selectedLoanOption: LoanOption = loanOptions[2]
    @State private var showCustomNumpad = false
    @State private var showKuponModal = false
    @State private var showSiPlinModal = false
    @State private var showToast = false
    @State private var toastMessage = ""
    @State private var toastType: ToastType = .warning
    @State var showOnBoarding: Bool = false
    // siplin recommendation state
    @State var siPlinRecommendation : Bool = false
    @State var rekomendasiPinjaman: String = "0"
    @State var alertSiPlin : Bool = false
    @State private var currSiPlinStep: SiPlinStep = .siPlinBorrowing

    
    let headerHeight: CGFloat = 120
    
    
    @State private var borrowingLoan: BorrowingLoan = BorrowingController().hitungPinjaman(
        jumlahDiterima: Double(defaultBorrowingValue) ?? 0,
        option: loanOptions[2]
    )
    
    var isAnySheetPresented: Bool {
        showJumlahPinjamanTooltipModal ||
        showMaksimumLimitTooltipModal ||
        showDurasiTenorTooltipModal ||
        showCicilanTooltipModal ||
        showKuponModal ||
        showSiPlinModal ||
        showCustomNumpad
    }
    
    
    @State private var path = NavigationPath()
    
    
    var body: some View {
        ZStack(alignment: .top){
            NavigationStack(path: $path) {
                ZStack(alignment: .bottom) {
                    Color.white.ignoresSafeArea()
                    VStack(spacing: 0) {
                        ScrollView {
                            VStack(spacing: 16) {
                                JumlahPinjamanInputBox(
                                    showJumlahPinjamanTooltipModal: $showJumlahPinjamanTooltipModal,
                                    showCustomNumpad: $showCustomNumpad,
                                    input: $jumlahPinjaman,
                                    showMaksimumLimitTooltip: $showMaksimumLimitTooltipModal,
                                    alertSiPlin: $alertSiPlin,
                                    showToastCallback: { type, message in
                                        toastType = type
                                        toastMessage = message
                                        showToast = false
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                                            withAnimation {
                                                showToast = true
                                            }
                                        }
                                    }

                                )
                                
                                if siPlinRecommendation {
                                    SiPlinActiveButton(
                                        rekomendasiPinjaman: $rekomendasiPinjaman,
                                        showSiPlinModal: $showSiPlinModal,
                                        siPlinRecommendation: $siPlinRecommendation,
                                        currSiPlinStep: $currSiPlinStep
                                    )
                                    .sheet(isPresented: $showSiPlinModal) {
                                        SiPlinView(
                                            showOnBoarding: $showOnBoarding,
                                            showSuccessToast: $showToast,
                                            toastType: $toastType,
                                            message: $toastMessage,
                                            selectedLoanOption: $selectedLoanOption,
                                            showSiPlinModal: $showSiPlinModal,
                                            borrowBind: $jumlahPinjaman,
                                            income: "9000000",
                                            siPlinRecommendation: $siPlinRecommendation,
                                            rekomendasiPinjaman: $rekomendasiPinjaman,
                                            currSiPlinStep: $currSiPlinStep
                                        )
                                        .presentationDetents([.height(800)])
                                    }

                                }else{
                                    Button(action: {
                                        showSiPlinModal = true
                                    }) {
                                        SiPlinInactiveButton()
                                    }
                                    .sheet(isPresented: $showSiPlinModal) {
                                        SiPlinView(showOnBoarding: $showOnBoarding, showSuccessToast: $showToast, toastType: $toastType, message: $toastMessage, selectedLoanOption: $selectedLoanOption, showSiPlinModal: $showSiPlinModal, borrowBind: $jumlahPinjaman, income: "9000000", siPlinRecommendation: $siPlinRecommendation, rekomendasiPinjaman: $rekomendasiPinjaman, currSiPlinStep: $currSiPlinStep)
                                            .presentationDetents([.height(800)])
                                    }
                                }
                                
                                
                                
                                DurasiTenorComponent(
                                    showDurasiTenorTooltipModal: $showDurasiTenorTooltipModal,
                                    options: loanOptions,
                                    selectedOption: $selectedLoanOption
                                )
                                
                                KuponComponent(showKuponModal: $showKuponModal)
                                
                                VStack(spacing: 0) {
                                    JumlahDiterimaDropdownComponent(
                                        jumlahDiterima: jumlahPinjaman,
                                        jumlahPengajuan: jumlahPinjaman
                                    )
                                    .padding(.bottom, -16)
                                    
                                    Divider()
                                        .background(Color("PrimaryGreen"))
                                        .padding(.horizontal, 16)
                                    
                                    CicilanDetailDropdownComponent(
                                        showCicilanTooltipModal: $showCicilanTooltipModal,
                                        borrowingLoan: $borrowingLoan,
                                        loanOption: $selectedLoanOption
                                    )
                                    .padding(.top, -16)
                                }
                                .padding(.top, -16)
                                
                                Spacer().frame(height: 100)
                            }
                            .padding(.top, headerHeight - 48)
                            .padding(.horizontal, 8)
                        }
                    }
                    
                    // Sticky Button
                    if !isAnySheetPresented {
                        VStack(spacing: 0) {
                            Divider()
                                .background(Color.gray.opacity(0.3))
                            
                            PrimaryButton {
                                path.append(borrowingLoan)
                            }
                            .padding(.horizontal, 16)
                            .padding(.top, 12)
                            .padding(.bottom, 24)
                            .background(
                                Color.white.opacity(0.8)
                                    .blur(radius: 2)
                                    .edgesIgnoringSafeArea(.bottom)
                            )
                        }
                    }
                    
                }
                .navigationDestination(for: BorrowingLoan.self) { loan in
                    SummaryView(borrowingLoan: loan, loanOption: selectedLoanOption)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                }
                
                // Sticky Header
                .overlay(
                    ZStack {
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(hex: "#D5F3DB"),
                                Color(hex: "#7FF895")
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        
                        VStack {
                            Image("logo-ec-bg")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200)
                                .opacity(0.2)
                                .offset(x: -140)
                            
                            
                        }
                        HStack {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Text("Go to EasyCashBorrower")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "headset")
                                .foregroundColor(.black)
                        }
                        .padding()
                        .padding(.top, 48)
                    }
                        .frame(height: headerHeight)
                        .ignoresSafeArea(edges: .top),
                    alignment: .top
                )
                
                // Custom Numpad
                if showCustomNumpad {
                    VStack(spacing: 0) {
                        Spacer()
                        
                        VStack(spacing: 16) {
                            CustomNumpad(input: $jumlahPinjaman)
                            
                            Button(action: {
                                withAnimation(.spring(response: 0.4, dampingFraction: 0.85)) {
                                    showCustomNumpad = false
                                }
                            }) {
                                Text("Konfirmasi")
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 16)
                                    .background(Color("PrimaryGreen"))
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .cornerRadius(12)
                                    .padding(.horizontal, 24)
                            }
                        }
                        .padding(.top, 16)
                        .padding(.bottom, 32)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -2)
                    }
                    .ignoresSafeArea(.keyboard)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .animation(.spring(response: 0.45, dampingFraction: 0.85), value: showCustomNumpad)
                }
                
            }
            if showToast {
                ToastView(type: toastType, message: toastMessage)
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
        }
        .fullScreenCover(isPresented: $showOnBoarding) {
            OnboardingView(showOnBoarding: $showOnBoarding, showSiPlinModal: $showSiPlinModal)
        }
        // MARK: - Sheets
        .sheet(isPresented: $showJumlahPinjamanTooltipModal) {
            JumlahPinjamanTooltip(isPresented: $showJumlahPinjamanTooltipModal)
                .presentationDetents([.height(320)])
        }
        .sheet(isPresented: $showMaksimumLimitTooltipModal) {
            LimitTooltip(isPresented: $showMaksimumLimitTooltipModal)
                .presentationDetents([.height(320)])
        }
        .sheet(isPresented: $showKuponModal) {
            KuponModalSheet(isPresented: $showKuponModal)
                .presentationDetents([.height(360)])
        }
        .sheet(isPresented: $showDurasiTenorTooltipModal) {
            DurasiTenorTooltip(isPresented: $showDurasiTenorTooltipModal)
                .presentationDetents([.height(320)])
        }
        .sheet(isPresented: $showCicilanTooltipModal) {
            RincianCicilanTooltip(isPresented: $showCicilanTooltipModal)
                .presentationDetents([.height(600)])
        }
        .onChange(of: jumlahPinjaman) { newValue in
            if let jumlahPinjamanDouble = Double(newValue) {
                borrowingLoan = BorrowingController().hitungPinjaman(jumlahDiterima: jumlahPinjamanDouble, option: selectedLoanOption)
            }
            if rekomendasiPinjaman != "0"{
                if let newVal = Double(newValue), let rekom = cleanCurrencyString(rekomendasiPinjaman) {
                    if newVal > rekom {
                        print("Alert SiPlin")
                        print("\(rekom)")
                        print(newVal)
                        alertSiPlin = true
                    } else {
                        alertSiPlin = false
                    }
                } else {
                    // Handle invalid input, e.g., show an error, log, or reset alert
                    print("Invalid input: cannot convert to Double")
                    alertSiPlin = false
                }
            }
            

        }
        .onChange(of: selectedLoanOption) { newOption in
            if let jumlahPinjamanDouble = Double(jumlahPinjaman) {
                borrowingLoan = BorrowingController().hitungPinjaman(jumlahDiterima: jumlahPinjamanDouble, option: newOption)
            }
        }
        
    }
}
