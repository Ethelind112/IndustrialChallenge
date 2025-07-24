//
//  AgreementBottomView.swift
//  IndustrialChallenge
//
//  Created by Amanda on 24/07/25.
//

import SwiftUI

struct AgreementBottomView: View {
    @Binding var isChecked: Bool
    var onAjukan: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            HStack(alignment: .center) {
                Button(action: {
                    isChecked.toggle()
                }) {
                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                        .foregroundColor(isChecked ? .green : .gray)
                        .font(.title3)
                }

                HStack{
                    Text("Saya telah baca dan menyetujui ")
                        .font(.system(size: 12))
                    +
                    Text("“Perjanjian pinjaman”")
                        .font(.system(size: 12))
                        .foregroundColor(.green)
                        .underline()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)

            Button(action: {
                onAjukan()
            }) {
                Text("Ajukan Pinjaman")
                    .foregroundColor(isChecked ? .white : .gray)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 22)
                    .background(isChecked ? Color.green : Color(.systemGray5))
                    .cornerRadius(8)
                    .fontWeight(.semibold)
            }
            .disabled(!isChecked)
            .padding(.horizontal)
        }
        .padding(.vertical, 16)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
}
