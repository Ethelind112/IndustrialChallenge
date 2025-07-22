//
//  CustomNumpad.swift
//  IndustrialChallenge
//
//  Created by Amanda on 22/07/25.
//

import SwiftUI
struct CustomNumpad: View {
    @Binding var input: String

    var body: some View {
        VStack(spacing: 20) {
            Grid(horizontalSpacing: 40, verticalSpacing: 20) {
                GridRow {
                    constructButton("1")
                    constructButton("2")
                    constructButton("3")
                }
                GridRow {
                    constructButton("4")
                    constructButton("5")
                    constructButton("6")
                }
                GridRow {
                    constructButton("7")
                    constructButton("8")
                    constructButton("9")
                }
                GridRow {
                    constructButton("0")
                    constructButton("000", isTripleZero: true)

                    Button {
                        if !input.isEmpty {
                            input.removeLast()
                        }
                    } label: {
                        Image(systemName: "delete.left")
                            .frame(width: 60, height: 60)
                    }
                }
            }

           
            .padding(.horizontal, 35)
            .padding(.top, 20)
        }
        .font(.title3.bold())
        .foregroundColor(.black)
    }
    
    func constructButton(_ text: String, isTripleZero: Bool = false) -> some View {
        Button {
            if isTripleZero {
                input += "000"
            } else {
                input += text
            }
        } label: {
            Text(text)
                .fontWeight(.bold)
                .frame(width: 60, height: 60)
        }
    }

   
}
