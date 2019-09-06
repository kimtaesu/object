
import Foundation

public class Event {
    let subject: String
    let datOfWeek: Date
    var from: Date
    var duration: TimeInterval
    
    public init(subject: String, datOfWeek: Date, from: Date, duration: TimeInterval
        ) {
        self.subject = subject
        self.datOfWeek = datOfWeek
        self.from = from
        self.duration = duration
    }
    
    public func isSatisfied(schedule: RecurringSchedule) -> Bool {
        if from != schedule.dayOfWeek ||
            from != schedule.from ||
            duration != schedule.duration
        {
            return false
        }
        
        return true
    }
    
    public func reschedule(schedule: RecurringSchedule) {
        self.from.addTimeInterval(daysDistance(schedule: schedule))
        duration = schedule.duration
    }
    
    private func daysDistance(schedule: RecurringSchedule) -> TimeInterval {
        return schedule.dayOfWeek.timeIntervalSince(self.from)
    }
}
