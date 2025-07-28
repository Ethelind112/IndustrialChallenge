//
//  SummaryView.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//
import SwiftUI

struct SummaryView: View {
    @Environment(\.dismiss) private var dismiss

    let borrowingLoan: BorrowingLoan
    let loanOption: LoanOption
    let headerHeight: CGFloat = 220

    @State private var isChecked = false
    @State private var showTooltip = false
    @State private var navigateToLoading = false


    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea() // background fallback

            ScrollView {
                VStack(spacing: 0) {
                    ZStack {
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(hex: "#B7F1C1"),
                                Color(hex: "#DEFFE4")
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .opacity(0.85)

                        Image("logo-ec-bg")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200)
                            .opacity(0.1)
                            .offset(x: 140)

                        Image("sparkle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 160)
                            .opacity(0.7)
                            .offset(x: -140, y: 25)

                        VStack(spacing: 18) {
                            HStack {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.black)
                                    .onTapGesture {
                                        dismiss()
                                    }

                                Spacer()

                                Text("Ringkasan Pinjaman")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)

                                Spacer()
                            }
                            .padding(.top, 8)

                            JumlahDiterimaTotalCicilan(borrowingLoan: borrowingLoan)
                        }
                        .padding()
                        .padding(.top, 52)
                    }
                    .frame(height: headerHeight)
                    .padding(.top, -60)

                    // Main content
                    VStack(spacing: 16) {
                        RincianCicilan(
                            showRincianCicilanTooltipModal: $showTooltip,
                            borrowingLoan: borrowingLoan,
                            loanOption: loanOption
                        )

                        CicilanPerBulanComponent(cicilanPerBulan: borrowingLoan.cicilanPerBulan)
                        DetailPinjamanComponent()
                        DefaultRiskReminderComponent()

                        Spacer(minLength: 140) // space for bottom button
                    }
                    .padding(.horizontal, 8)
                }
            }

            // Sticky Bottom Button
            if !showTooltip {
                VStack(spacing: 0) {
                    Spacer()
                    
                    ZStack {
                        NavigationLink(
                            destination: LoadingPengajuanView(),
                            isActive: $navigateToLoading,
                            label: { EmptyView() }
                        )

                        AgreementBottomView(isChecked: $isChecked) {
                            if isChecked {
                                navigateToLoading = true
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 12)
                    .padding(.bottom, 8)
                    .background(
                        Color.white.opacity(0.9)
                            .blur(radius: 1)
                            .ignoresSafeArea(edges: .bottom)
                    )


                    
                }
            }
        }
        .sheet(isPresented: $showTooltip) {
            RincianCicilanTooltip(isPresented: $showTooltip)
                .presentationDetents([.height(650)])
        }
    }
}
