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

    let headerHeight: CGFloat = 135

    var body: some View {
        ZStack(alignment: .top) {
            // MARK: - White Scrollable Background
            Color.white.ignoresSafeArea()
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
            // MARK: - Scrollable Content
            ScrollView {
                VStack(spacing: 16) {
                    VStack {
                        JumlahPinjamanInputBox(
                            showJumlahPinjamanTooltipModal: $showJumlahPinjamanTooltipModal,
                            showCustomNumpad: $showCustomNumpad,
                            input: $jumlahPinjaman,
                            showMaksimumLimitTooltip: $showMaksimumLimitTooltipModal
                            , showToastCallback: {
                                type, message in
                                toastType = type
                                toastMessage = message
                                showToast = true
                            }
                        )
                    }
                    Button(action: {
                        showSiPlinModal = true
                    }) {
                        SiPlinInactiveButton()
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
                            jumlahPinjaman: Double(jumlahPinjaman) ?? 0,
                            selectedLoanOption: selectedLoanOption
                        )
                        .padding(.top, -16)
                    }
                    .padding(.top, -16)

                    PrimaryButton()
                }
                .padding(.top, headerHeight-48)
                .padding(.horizontal, 8)
            }

            // MARK: - Sticky Header
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
                           .offset(x: -140, y: 0)
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
            .ignoresSafeArea(edges: .top)
            if showCustomNumpad {
                VStack(spacing: 0) {
                    Spacer()

                    VStack(spacing: 16) {
                        CustomNumpad(input: $jumlahPinjaman)

                        Button(action: {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.85, blendDuration: 0.25)) {
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
                .animation(.spring(response: 0.45, dampingFraction: 0.85, blendDuration: 0.3), value: showCustomNumpad)
            }
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
        .sheet(isPresented: $showSiPlinModal) {
            SiPlinView(income: "6000000", borrowed: jumlahPinjaman)
                .presentationDetents([.height(800)])
        }
    }
}

struct BorrowingView_Previews: PreviewProvider {
    static var previews: some View {
        BorrowingView()
    }
}
