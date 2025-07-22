//
//  CicilanDetailDropdownComponent.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//

import SwiftUI

struct CicilanDetailDropdownComponent: View {
    @State private var isExpanded = false
    @Binding var showCicilanTooltipModal: Bool
    var body: some View {
        VStack(spacing: 0) {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    HStack{
                        Text("Cicilan Perbulan")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Button {
                                showCicilanTooltipModal = true
                                            } label: {
                                                Image(systemName: "info.circle")
                                                    .font(.system(size: 12))
                                                    .foregroundColor(Color("ToolTipBlue"))
                                            }
                    }
                    
                    
                    Spacer()
                    Text("Rp2.340.000,00")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white)
                .clipShape(RoundedCorner(radius: 12, corners: [.bottomLeft, .bottomRight]))
            }

            if isExpanded {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Durasi Tenor")
                            .font(.system(size: 14))
                        Spacer()
                        Text("3 bulan").fontWeight(.semibold)
                            .font(.system(size: 14))
                            .foregroundColor(Color("PrimaryGreen"))
                    }

                    HStack {
                        Text("Bunga (0.3% x 3)")
                            .font(.system(size: 14))
                        Spacer()
                        
                        Text("Rp 162.900,00")
                            .font(.system(size: 14)).fontWeight(.medium)
                    }

                    HStack {
                        Text("Biaya Layanan (10%)").font(.system(size: 14))
                        Spacer()
                        Text("Rp 600.000,00").font(.system(size: 14)).fontWeight(.medium)
                    }

                    HStack {
                        Text("PPn (4.3%)").font(.system(size: 14))
                        Spacer()
                        Text("Rp 258.000,00").font(.system(size: 14)).fontWeight(.medium)
                    }

                    Divider()

                    HStack {
                        Text("Total Cicilan").font(.system(size: 14))
                            .fontWeight(.medium)
                        Spacer()
                        Text("Rp 7.020.000,00")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                    }
                }
                .padding()
                .background(Color.white)
            }
        }
        .padding()
    }
}
