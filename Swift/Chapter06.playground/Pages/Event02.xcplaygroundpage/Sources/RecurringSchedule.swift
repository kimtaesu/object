import Foundation

public struct RecurringSchedule {
    private let subject: String
    let dayOfWeek: Date
    let from: Date
    let duration: TimeInterval
}

