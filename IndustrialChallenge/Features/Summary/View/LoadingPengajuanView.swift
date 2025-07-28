//
//  LoadingPengajuanView.swift
//  IndustrialChallenge
//
//  Created by Amanda on 28/07/25.
//
import SwiftUI

struct LoadingPengajuanView: View {
    @State private var isAnimating = false
    @State private var showToast = false

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(spacing: 20) {
                // Spinner
                Circle()
                    .trim(from: 0.0, to: 0.7)
                    .stroke(Color("PrimaryGreen"), lineWidth: 5)
                    .frame(width: 40, height: 40)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isAnimating)

                // Loading Message
                Text("Sedang memproses pengajuan pinjaman kamu...")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }

            // Toast
            if showToast {
                VStack {
                    ToastView(type: .success, message: "Pinjaman berhasil diajukan!")
                    Spacer()
                }
                .transition(.move(edge: .top).combined(with: .opacity))
                .animation(.easeInOut(duration: 0.3), value: showToast)
            }
        }
        .onAppear {
            isAnimating = true

            // Show toast after 2 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showToast = true
                }

                // Hide toast after 3 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        showToast = false
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true) // Hide back button
    }
}
