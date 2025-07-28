//
//  IndustrialChallengeApp.swift
//  IndustrialChallenge
//
//  Created by Ethelind Septiani Metta on 20/07/25.
//

import SwiftUI
import SwiftData

@main
struct IndustrialChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            BorrowingView()
        } .modelContainer(for: [BorrowingLoanRequest.self])
    }
}
