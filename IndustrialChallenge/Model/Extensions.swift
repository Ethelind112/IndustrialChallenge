//
//  Extensions.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import Foundation

extension String {
    
    func formatToRupiahStyle() -> String {
        guard let number = Double(self) else { return self }

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        formatter.decimalSeparator = "," // optional kalau kamu pakai desimal
        formatter.locale = Locale(identifier: "id_ID")
        formatter.maximumFractionDigits = 0

        return formatter.string(from: NSNumber(value: number)) ?? self
    }

    
    func formatWithoutDot() -> String {
        return self.replacingOccurrences(of: ".", with: "")
    }
    
    func formatAsDecimal() -> String {
        let pattern = #"(\d[\d\.]*)"#
        let regex = try? NSRegularExpression(pattern: pattern)
        
        guard let regex = regex else { return self }
        
        let matches = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
        
        var formatted = self
        for match in matches.reversed() {
            if let range = Range(match.range, in: self) {
                let numberString = String(self[range]).replacingOccurrences(of: ".", with: "")
                if let number = Int(numberString) {
                    let formatter = NumberFormatter()
                    formatter.numberStyle = .decimal
                    formatter.groupingSeparator = "."
                    formatter.locale = Locale(identifier: "id_ID") // or your preferred locale
                    if let formattedNumber = formatter.string(from: NSNumber(value: number)) {
                        formatted.replaceSubrange(range, with: formattedNumber)
                    }
                }
            }
        }
        return formatted
    }
}
