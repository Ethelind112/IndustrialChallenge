//
//  View.swift
//  IndustrialChallenge
//
//  Created by Wiwi Oktriani on 24/07/25.

import SwiftUI

struct OnboardingView: View {
    let images = ["PageOne", "PageTwo", "PageThree", "PageFour", "PageFive"]
    @ObservedObject var countTimer = CountTimer(items: 5, interval: 4.0)
    @Environment(\.dismiss) private var dismiss
    
    @Binding var showOnBoarding: Bool
    @Binding var showSiPlinModal: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            Image(images[min(Int(countTimer.progress), images.count - 1)])
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .animation(.none, value: countTimer.progress)
            
            VStack {
                HStack {
                    Spacer()
                        .padding(.trailing)
                    Button(action: {
                        showOnBoarding = false
                        showSiPlinModal = true
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .bold))
                            .padding(10)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 30)
                    .padding(.top, 110)
                }
            }

            // Progress Bar
            HStack(spacing: 4) {
                ForEach(images.indices, id: \.self) { index in
                    LoadingBar(progress: min(max(CGFloat(countTimer.progress) - CGFloat(index), 0.0), 1.0))
                        .frame(height: 3)
                        .animation(.linear, value: countTimer.progress)
                }
            }
            .padding(.top, 70)
            .padding(.horizontal)

            // Tapable areas
            HStack(spacing: 0) {
                Rectangle()
                    .foregroundColor(.clear)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        print("Tapped LEFT")
                        countTimer.advancePage(by: -1)
                    }

                Rectangle()
                    .foregroundColor(.clear)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        print("Tapped RIGHT")
                        countTimer.advancePage(by: 1)
                    }
            }
            .ignoresSafeArea()
            if Int(countTimer.progress) == images.count - 1 {
                VStack {
                    Spacer()
                    Button("Coba Sekarang!") {
                        showOnBoarding = false
                        showSiPlinModal = true
                        dismiss()
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.primaryGreen)
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 60)
                }
            }
        }
        .onAppear {
            countTimer.start()
        }
    }
}

//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView()
//    }
//}
