//
//  NumberKeyboard.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import SwiftUI

struct NumberKeyboard: View {
    @Binding var inputs: String
    
    var body: some View {
        Grid(alignment: .center, horizontalSpacing: 70, verticalSpacing: 20){
            GridRow{
                constructButton(text: "1")
                
                constructButton(text: "2")
                
                constructButton(text: "3")
            }
            
            GridRow {
                constructButton(text: "4")
                
                constructButton(text: "5")
                
                constructButton(text: "6")
            }
            
            GridRow {
                constructButton(text: "7")
                
                constructButton(text: "8")
                
                constructButton(text: "9")
            }
            
            GridRow {
                constructButton(text: "0")
                
                constructButton(text: "000")
                
                Button {
                    if inputs != ""{
                        inputs.removeLast()
                        inputs = inputs.formatToRupiahStyle()
                    }
                } label: {
                    Image(systemName: "delete.left")
                }
                .frame(width: 50, height: 50)
            }
        }
    }
    
    func constructButton(text: String) -> some View{
        Text(text)
            .frame(width: 50, height: 50)
            .onTapGesture {
                inputs = (inputs + text).formatToRupiahStyle()
            }
    }
}
