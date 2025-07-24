//
//  DurasiTenorComponent.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//

import SwiftUI
struct DurasiTenorComponent: View {
    @Binding var showDurasiTenorTooltipModal: Bool
    let options: [LoanOption]
    @Binding var selectedOption: LoanOption

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Durasi Tenor").font(.callout).fontWeight(.semibold)
                Button {
                    showDurasiTenorTooltipModal = true
                } label: {
                    Image(systemName: "info.circle")
                        .font(.system(size: 12))
                        .foregroundColor(Color("ToolTipBlue"))
                }

                Spacer()
                Text("1x Cicilan Per Bulan")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
            }

            HStack {
                ForEach(options, id: \.tenorInMonths) { option in
                    if option.tenorInMonths == 12{
                        DurasiTenorButton(
                            month: option.tenorInMonths,
                            isActive: selectedOption == option,
                            isBest: true
                        ) {
                            selectedOption = option
                        }

                        if option != options.last {
                            Spacer()
                        }
                       
                        
                    }else{
                        DurasiTenorButton(
                            month: option.tenorInMonths,
                            isActive: selectedOption == option,
                            isBest: false
                        ) {
                            selectedOption = option
                        }

                        if option != options.last {
                            Spacer()
                        }
                    }
                    
                }
                
            }
            if selectedOption.tenorInMonths == 12{
                Text("Wah, 90% orang memilih ini! Lebih Hemat!")
                    .font(.caption2)
                    .fontWeight(.medium)
                    .foregroundColor(Color("DarkGreen"))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 4)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color("SecondaryGreen").opacity(0.6))
                    .cornerRadius(8)
            }

            
        }
        .padding(.vertical, 22)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color("AdditionalColorLightGray"), lineWidth: 1)
                )
        )
        .padding(.horizontal, 12)
    }
}
struct DurasiTenorButton: View {
    let month: Int
    let isActive: Bool
    let isBest: Bool
    let onTap: () -> Void

    var body: some View {
        if isBest{
            ZStack{
                Text("\(month) bulan")
                    .font(.system(size: 13))
                    .foregroundColor(isActive ? .white : .black)
                    .padding(.horizontal, 27)
                    .padding(.vertical, 8)
                    .background(isActive ? Color("SecondaryGreen") : Color("PrimaryLightGreen"))
                    .cornerRadius(8)
                    .onTapGesture {
                        onTap()
                    }
                Image("best-option-star")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16)
                    .offset(x: 40, y: -16)
            }
            
        }else{
            Text("\(month) bulan")
                .font(.system(size: 13))
                .foregroundColor(isActive ? .white : .black)
                .padding(.horizontal, 27)
                .padding(.vertical, 8)
                .background(isActive ? Color("SecondaryGreen") : Color("PrimaryLightGreen"))
                .cornerRadius(8)
                .onTapGesture {
                    onTap()
                }
        }
        
    }
}
