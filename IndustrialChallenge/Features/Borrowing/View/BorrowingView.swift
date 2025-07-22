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
    @State private var input: String = ""
    @State private var showCustomNumpad = false
    @State private var showKuponModal = false

    var body: some View {
        ZStack {
            NavigationView {
                VStack(spacing: 0) {
                    ScrollView {
                        VStack(spacing: 16) {
                            VStack {
                                JumlahPinjamanInputBox(
                                    showJumlahPinjamanTooltipModal: $showJumlahPinjamanTooltipModal,
                                    showCustomNumpad: $showCustomNumpad,
                                    input: $input
                                )
                                MaksimumLimitBox(showMaksimumLimitTooltip: $showMaksimumLimitTooltipModal)
                            }

                            SiPlinInactiveButton()
                            DurasiTenorComponent(showDurasiTenorTooltipModal: $showDurasiTenorTooltipModal)
                            KuponComponent(showKuponModal: $showKuponModal)

                            VStack(spacing: 0) {
                                JumlahDiterimaDropdownComponent().padding(.bottom, -16)
                                Divider()
                                    .background(Color("PrimaryGreen"))
                                    .padding(.horizontal, 16)
                                CicilanDetailDropdownComponent(showCicilanTooltipModal: $showCicilanTooltipModal)
                                    .padding(.top, -16)
                            }
                            .padding(.top, -16)

                            PrimaryButton()
                        }
                        .padding(.top, 16)
                        .padding(.horizontal, 8)
                        .frame(maxWidth: .infinity, alignment: .top)
                    }
                    .background(Color("BackgroundGray").ignoresSafeArea())
                }
                .navigationTitle("Go to EasyCash Borrower")
                .navigationBarTitleDisplayMode(.inline)
            }

            if showCustomNumpad {
                VStack(spacing: 0) {
                    Spacer()

                    VStack(spacing: 16) {
                        CustomNumpad(input: $input)

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
                .presentationDetents([.height(480)])
        }
    }
}

