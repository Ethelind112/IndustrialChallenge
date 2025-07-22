//
//  JumlahPinjamanInputBox.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//

import SwiftUI

struct JumlahPinjamanInputBox: View {
    @Binding var showJumlahPinjamanTooltipModal: Bool
    @Binding var showCustomNumpad: Bool
    @Binding var input: String
    
    @State private var showAlert = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Text("Jumlah Pinjaman")
                    .font(.callout).fontWeight(.semibold)
                Button {
                    showJumlahPinjamanTooltipModal = true
                } label: {
                    Image(systemName: "info.circle")
                        .font(.system(size: 12))
                        .foregroundColor(Color("ToolTipBlue"))
                }
            }

            HStack {
                Text("Rp.")
                    .font(.headline)
                    .foregroundColor(.black)

                Text(input.isEmpty ? "1.000.000" : formatToRupiahStyle(input))
                    .font(.headline)
                    .foregroundColor(input.isEmpty ? .gray : .black)
                    .onTapGesture {
                        showCustomNumpad = true
                    }

                Spacer()

                Button {
                    showCustomNumpad.toggle()
                } label: {
                    Image(systemName: "pencil")
                        .font(.body)
                        .foregroundColor(.gray)
                }
            }

            Divider().background(Color("PrimaryGreen"))
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
        )
        .padding(.horizontal, 12)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Jumlah terlalu besar"),
                message: Text("Maksimum jumlah pinjaman adalah Rp60.000.000"),
                dismissButton: .default(Text("OK"))
            )
        }
        .onChange(of: input) { newValue in
            let clean = newValue.filter { $0.isNumber }
            if let intVal = Int(clean), intVal > 60000000 {
                input = "60000000" // Set max
                showAlert = true
            }
        }
    }
}


func formatToRupiahStyle(_ input: String) -> String {
    // Remove any non-digit characters
    let cleanInput = input.filter { $0.isNumber }

    // Convert to number
    guard let number = Int(cleanInput) else { return input }

    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = "."
    formatter.locale = Locale(identifier: "id_ID")

    return formatter.string(from: NSNumber(value: number)) ?? input
}
