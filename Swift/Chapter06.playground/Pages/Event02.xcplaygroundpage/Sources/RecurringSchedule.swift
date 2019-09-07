import Foundation

public struct RecurringSchedule {
    private let subject: String
    let dayOfWeek: Date
    let from: Date
    let duration: TimeInterval
    
    public init(subject: String, dayOfWeek: Date, from: Date, duration: TimeInterval) {
        self.subject = subject
        self.dayOfWeek = dayOfWeek
        self.from = from
        self.duration = duration
    }
}
