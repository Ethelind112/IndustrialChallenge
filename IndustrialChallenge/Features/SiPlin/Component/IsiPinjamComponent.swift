//
//  IsiPinjamComponent.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 23/07/25.
//

import SwiftUI

struct IsiPinjamComponent: View {
    @Binding var borrowed: String
    @Binding var isError: Bool
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Mau Pinjam Berapa?")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(isError ? .red : .black)
            
            HStack {
                Text("Rp")
                
                TextField("Jumlah Pinjaman", text: $borrowed)
                    .disabled(true)
            }
            .font(.title3)
            .fontWeight(.bold)
            
            Rectangle()
                .frame(height: 1, alignment: .bottom)
                .foregroundColor(isError ? .red : .primaryGreen)
            
            
            
            HStack {
                if isError {
                    Text("Nominal pinjaman melebihi maksimum limit! ")
                        .font(.caption)
                        .foregroundColor(.red)
                } else {
                    Text("Maksimum Limit Pinjaman")
                }
                
                Spacer()
                Text("Rp. 60.000.000")
                    .foregroundColor(isError ? .red : .black)
            }
            .font(.caption)
            
        }
    }
}
