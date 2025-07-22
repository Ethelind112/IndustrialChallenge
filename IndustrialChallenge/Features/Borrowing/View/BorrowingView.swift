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
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 8) {
                        JumlahPinjamanInputBox(showJumlahPinjamanTooltipModal: $showJumlahPinjamanTooltipModal)
                        MaksimumLimitBox(showMaksimumLimitTooltip: $showMaksimumLimitTooltipModal)
                        SiPlinInactiveButton().padding(.top, 12)
                    }
                    .padding(.top, 16)
                    .frame(maxWidth: .infinity, alignment: .top)
                }
                .background(Color("BackgroundGray").ignoresSafeArea())
            }
            .navigationTitle("Go to EasyCash Borrower")
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $showJumlahPinjamanTooltipModal) {
            JumlahPinjamanTooltip(isPresented: $showJumlahPinjamanTooltipModal)
                .presentationDetents([.height(320)])
        }
        .sheet(isPresented: $showMaksimumLimitTooltipModal) {
           LimitTooltip(isPresented: $showMaksimumLimitTooltipModal)
                .presentationDetents([.height(320)])
        }
    }
}

#Preview {
    BorrowingView()
}


#Preview{
    BorrowingView()
}
