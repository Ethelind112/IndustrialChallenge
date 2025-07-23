//
//  RecommendationSheet.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 23/07/25.
//

import SwiftUI

struct RecommendationSheet: View {
    @Binding var currsiPlinStep: SiPlinStep
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                HeaderExpense(currSiPlinStep: $currsiPlinStep, title: "Rekomendasi Pinjaman")
                
                ScrollView {
                    VStack {
                        VStack {
                            Text("Yuk Pinjam Sesuai Surplusmu!")
                                .font(.system(size: 14, weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                            
                            
                            Text("Jumlah pinjaman yang kamu ajukan belum sesuai dengan kapabilitas keuanganmu saat ini.")
                                .font(.caption)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding(.vertical, 12)
                            
                            VStack {
                                DetailRecommendationComponent(backgroundColor: .primaryLightGreen, borderColor: .clear, sectionTitle: "Rekomendasi Pinjaman Tertinggi", optionalText: "test", recommended: "9.000.000")
                                
                                DetailRecommendationComponent(backgroundColor: .white, borderColor: .additionalColorLightGray, sectionTitle: "Rekomendasi Pinjaman Tertinggi", optionalText: "test", recommended: "9.000.000")
                            }
                        }
                        .padding(.bottom, 24)
                        
                        VStack {
                            Text("Eksplor Opsi Tenor")
                                .font(.system(size: 14, weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                            
                            
                            SurplusBanner(surplus: "200000")
                                .padding(.bottom, 24)
                            
                            ForEach(0..<3, id: \.self) { option in
                                OptionComponent(option: "Cicilan 3 Bulan", selectedOption: String(option))
                            }
                            
                            
                        }
                    }
                }
                .padding(.top, 5)
                
                Button{
                    
                }label: {
                    RecommendationViewButton(textButton: "Gunakan Opsi", textColor: .white, backgroundColor: .primaryGreen)
                }
                
                Button{
                    
                }label: {
                    RecommendationViewButton(textButton: "Ulangi Rekomendasi", textColor: .primaryGreen, backgroundColor: .primaryLightGreen)
                }

            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    @Previewable @State var currSiPlinStep = SiPlinStep.siPlinBorrowing
    
    RecommendationSheet(currsiPlinStep: $currSiPlinStep)
}
