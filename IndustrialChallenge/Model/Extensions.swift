//
//  Extensions.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 22/07/25.
//

import Foundation

extension String {
    
    func formatToRupiahStyle() -> String {
        // Remove any non-digit characters
        let cleanInput = self.filter { $0.isNumber }

        // Convert to number
        guard let number = Int(cleanInput) else { return self }

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        formatter.locale = Locale(identifier: "id_ID")

        return formatter.string(from: NSNumber(value: number)) ?? self
    }
}
