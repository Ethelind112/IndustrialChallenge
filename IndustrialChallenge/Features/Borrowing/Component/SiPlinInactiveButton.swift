//
//  SiPlinInactiveButton.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//

import SwiftUI

struct SiPlinInactiveButton : View{
    var body: some View{
        HStack(spacing: 0){
            Image("rounded-siplin").resizable().frame(width: 65, height: 55)
            VStack(alignment: .leading, spacing: 4){
                Text("Bingung menentukan jumlah pinjaman?")
                    .font(.system(size: 13))
                    .foregroundStyle(Color.black).fontWeight(.semibold)
               (
                Text("Gunakan rekomendasi ") + Text("SiPlin").fontWeight(.semibold)
               ).font(.system(size: 14)).foregroundColor(Color("DarkGreen"))
            }
            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(
                   LinearGradient(
                       gradient: Gradient(colors: [
                           Color(red: 213/255, green: 243/255, blue: 219/255),
                           Color(red: 233/255, green: 249/255, blue: 236/255)
                       ]),
                       startPoint: .leading,
                       endPoint: .trailing
                   )
                   .cornerRadius(16)
                   
               )
            .padding(.horizontal, 12)
    }
    
}


#Preview {
    SiPlinInactiveButton()
}
