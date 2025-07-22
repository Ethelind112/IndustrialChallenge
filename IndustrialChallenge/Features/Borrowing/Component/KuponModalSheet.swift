//
//  KuponModalSheet.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//

import SwiftUI


struct KuponModalSheet: View {
    @Binding var isPresented: Bool 
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedDuration = "9 Bulan"
    
    var body: some View {
        VStack(spacing: 8) {
            // MARK: - Header
            HStack {
                Spacer()
                Text("Kupon")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                }
            }
            .padding(.top, 24)
            .padding(.horizontal)
            .padding(.bottom, 8)
            
            Divider()
            
            HStack {
                Circle()
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: 24, height: 24)
                
                VStack(alignment: .leading) {
                    Text("Langganan VIP")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                    Text("Rp50.000")
                        .font(.system(size: 14))
                }
                Spacer()
                HStack(spacing: 4) {
                    DurationChip(label: "3 Bulan", selected: selectedDuration == "3 Bulan") {
                        selectedDuration = "3 Bulan"
                    }
                    DurationChip(label: "9 Bulan", selected: selectedDuration == "9 Bulan") {
                        selectedDuration = "9 Bulan"
                    }
                }
            }
            .padding(.top, 16)
            .padding(.horizontal, 24)
            
            Image("kupon-component").padding(.vertical, 16)
            HStack {
                Text("Lihat keuntungan lainnya")
                
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: "chevron.right")
                
                    .font(.system(size: 14))
                    .foregroundColor(.black)
            }
            .padding(.horizontal, 24)

            Spacer()
            Button {
            } label: {
                Text("Konfirmasi")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
        .cornerRadius(24)
    }
}

struct DurationChip: View {
    var label: String
    var selected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.system(size: 14))
                .padding(.vertical, 6)
                .padding(.horizontal, 12)
                .background(selected ? Color.green : Color.green.opacity(0.1))
                .foregroundColor(selected ? .white : .black)
                .cornerRadius(8)
        }
    }
}
