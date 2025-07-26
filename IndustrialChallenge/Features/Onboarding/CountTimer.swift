//
//  CountTimer.swift
//  IndustrialChallenge
//
//  Created by Wiwi Oktriani on 24/07/25.


import Foundation
import Combine

class CountTimer: ObservableObject {
    @Published var progress: Double
    private var interval: TimeInterval
    private var maxItems: Int    // <-- renamed!
    private let publisher: Timer.TimerPublisher
    private var cancellable: Cancellable?

    init(items: Int, interval: TimeInterval) {
        self.maxItems = items
        self.progress = 0
        self.interval = interval
        self.publisher = Timer.publish(every: 0.1, on: .main, in: .default)
    }

    func start() {
        self.cancellable = self.publisher.autoconnect().sink { _ in
            var newProgress = self.progress + (0.1 / self.interval)
            if Int(newProgress) >= self.maxItems {
                newProgress = 0
            }
            self.progress = newProgress
        }
    }

    func advancePage(by number: Int) {
        let currentPage = Int(progress)
        let newPage = Swift.max(Swift.min(currentPage + number, maxItems - 1), 0)
        progress = Double(newPage)
    }
}
