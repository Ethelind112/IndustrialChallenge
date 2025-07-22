//
//  DurasiTenorComponent.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//

import SwiftUI

struct DurasiTenorComponent : View{
    @Binding var showDurasiTenorTooltipModal: Bool
    
    var body: some View{
        VStack(alignment: .leading, spacing: 16){
           HStack{
               HStack{
                   Text("Durasi Tenor").font(.callout).fontWeight(.semibold)
                   Button {
                       showDurasiTenorTooltipModal = true
                                   } label: {
                                       Image(systemName: "info.circle")
                                           .font(.system(size: 12))
                                           .foregroundColor(Color("ToolTipBlue"))
                                   }
               }
              
               Spacer()
               Text("1x cicilan per bulan").font(.system(size: 14)).fontWeight(.medium)
           }
            HStack{
                DurasiTenorButton(month: 3)
                Spacer()
                DurasiTenorButton(month: 6)
                Spacer()
                DurasiTenorButton(month: 9, isActive: true)
            }
            VStack(alignment: .leading){
                Text("Wah, 90% orang memilih ini! Lebih Hemat!")
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.caption2)
                    .foregroundColor(Color.white)
                    .padding(.vertical, 8)
                    .foregroundStyle(Color.white)
                    .background(Color("SecondaryGreen"))
                    .cornerRadius(8)
                
                
            }
        }
        .padding(.vertical, 22)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
        )
        .padding(.horizontal, 12)
    }
}


struct DurasiTenorButton : View{
    @State var month : Int
    @State var isActive: Bool = false
    var body: some View{
        if isActive{
            Text("\(month) bulan")
                .font(.system(size: 13))
                .foregroundStyle(.white)
                .padding(.horizontal, 27)
                .padding(.vertical, 8)
                .background(Color("SecondaryGreen"))
                .cornerRadius(8)
                
            
        }else{
            Text("\(month) bulan")
                .font(.system(size: 13))
                .padding(.horizontal, 27)
                .padding(.vertical, 8)
                .background(
                    Color("PrimaryLightGreen")
                )
                .cornerRadius(8)
                
            
        }
        
    }
}
