//
//  ToastView.swift
//  IndustrialChallenge
//
//  Created by Wiwi Oktriani on 24/07/25.
//

import SwiftUI

enum ToastType {
    case warning
    case success
    
    var color: Color {
          switch self {
          case .warning:
              return Color(red: 1.0, green: 210/255, blue: 127/255)
          case .success:
              return Color(red: 135/255, green: 221/255, blue: 152/255)
          }
      }
      
    var iconName: String {
        switch self {
        case .warning:
            return "exclamationmark.triangle.fill"
        case .success:
            return "checkmark.circle.fill"
        }
    }
    
    var title: String {
        switch self {
        case .warning:
            return "Warning"
        case .success:
            return "Success"
        }
    }
}

struct ToastView: View {
    var type: ToastType
    var message: String

    var body: some View {
        HStack(spacing: 12) {
            Rectangle()
                .fill(type.color)
                .frame(width: 6, height: 60)
                .cornerRadius(3, corners: [.topLeft, .bottomLeft])
                .padding(.leading, 8)

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 6) {
                    Image(systemName: type.iconName)
                        .foregroundColor(type.color)
                        .font(.system(size: 16))

                    Text(type.title)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                }

                Text(message)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 80)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        .padding(.horizontal, 16)
    }
}
//struct ToastView: View {
//    var type: ToastType
//    var message: String
//
//    var body: some View {
//        HStack(spacing: 12) {
//            // Left-side stroke
//            Rectangle()
//                .fill(type.color)
//                .frame(width: 20, height: 2)
//                .cornerRadius(6, corners: UIRectCorner([.topLeft, .bottomLeft]))
//            
//            VStack(alignment: .leading, spacing: 4) {
//                HStack(spacing: 6) {
//                    Image(systemName: type.iconName)
//                        .foregroundColor(type.color)
//                    Text(type.title)
//                        .font(.headline)
//                        .foregroundColor(.black)
//                }
//                
//                Text(message)
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//            }
//            .padding(.vertical, 12)
//            .padding(.horizontal, 12)
//        }
//        .background(Color.white)
//        .cornerRadius(8)
//        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
//        .padding(.horizontal, 24)
//        .frame(maxWidth: 320, alignment: .center)
//    }
//}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            ToastView(type: .warning, message: "Nominal pinjaman belum dimasukkan!")
            ToastView(type: .success, message: "Pinjaman berhasil diajukan!")
        }
        .padding()
        .background(Color(UIColor.systemGroupedBackground))
    }
}
