//
//  NumberKeyboard.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import SwiftUI

struct Calculator: View {
    @Binding var inputs: String
    @Binding var computation: String
    
    @State var isComputation: Bool = false

    var body: some View {
        Grid(alignment: .center, horizontalSpacing: 40, verticalSpacing: 20){
            GridRow{
                constructButton(text: "1")
                
                constructButton(text: "2")
                
                constructButton(text: "3")
                
                constructButton(text: "÷")
                    .background(.primaryLightGreen)
                    .cornerRadius(48)
            }
            
            GridRow {
                constructButton(text: "4")
                
                constructButton(text: "5")
                
                constructButton(text: "6")
                
                constructButton(text: "x")
                    .background(.primaryLightGreen)
                    .cornerRadius(48)
            }
            
            GridRow {
                constructButton(text: "7")
                
                constructButton(text: "8")
                
                constructButton(text: "9")
                
                constructButton(text: "-")
                    .background(.primaryLightGreen)
                    .cornerRadius(48)
            }
            
            GridRow {
                constructButton(text: "0")
                
                constructButton(text: "000")
                
                Button {
                    
                    if isComputation{
                        let operation: Set<String> = ["+", "-", "X", "÷"]
                        
                        if let lastChar = computation.last, operation.contains(String(lastChar)) {
                            isComputation = false
                            computation = ""
                        } else {
                            computation.removeLast()
                            
                            if let lastChar = computation.last, !operation.contains(String(lastChar)) {
                                let calculationResult = evaluate(formatWithoutDot(computation))
                                inputs = String(calculationResult ?? 0).formatAsDecimal()
                                computation = computation.formatAsDecimal()
                            }else {
                                var result = computation
                                result.removeLast()
                                inputs = result
                            }
                        }
                        
                    } else if inputs != ""{
                        inputs.removeLast()
                        inputs = inputs.formatAsDecimal()
                    }
                } label: {
                    Image(systemName: "delete.left")
                }
                .foregroundColor(.black)
                
                constructButton(text: "+")
                    .background(.primaryLightGreen)
                    .cornerRadius(48)
            }
        }
    }
    
    func constructButton(text: String) -> some View{
        
        Text(text)
            .frame(width: 50, height: 50)
        .onTapGesture {
            let operation: Set<String> = ["+", "-", "x", "÷"]
            
            if operation.contains(text)  {
                
                if inputs == "" {
                    computation = "0"
                    inputs = "0"
                }
                
                let operation: Set<String> = ["+", "-", "x", "÷"]
                
                if let lastChar = computation.last, operation.contains(String(lastChar)) {
                    computation.removeLast()
                } else {
                    var temp: String = ""
                    
                    if computation == "" {
                        temp = inputs
                    } else {
                        temp = computation
                    }
                    
                    computation = inputs
                    
                    let calculationResult = evaluate(formatWithoutDot(temp))
                    
                    inputs = String(calculationResult ?? 0).formatAsDecimal()
                    
                    isComputation = true
                }
            } else if inputs != "" && isComputation && !operation.contains(text) {
                let toCalculate = computation + text
                let calculationResult = evaluate(formatWithoutDot(toCalculate))
                
                inputs = String(calculationResult ?? 0).formatAsDecimal()
            }
            
            if !isComputation {
                inputs = (inputs + text).formatAsDecimal()
            } else {
                computation = (computation + text).formatAsDecimal()
            }
        }
    }
    
    func formatWithoutDot(_ value: String) -> String {
        return value.replacingOccurrences(of: ".", with: "")
    }
    
    func evaluate(_ expression: String) -> Int? {
        let mathExpression = expression.replacingOccurrences(of: "x", with: "*")
                                         .replacingOccurrences(of: "÷", with: "/")
        let exp = NSExpression(format: mathExpression)
        if let result = exp.expressionValue(with: nil, context: nil) as? NSNumber {
            return result.intValue
        }
        return nil
    }
}


//#Preview {
//    Calculator(inputs: "9000000")
//}
