import Foundation


public struct PeriodCondition {
    
    let dayOfWeek: Date
    let startTime: Date
    let endTime: Date
    
    func isSatisfiedBy(screening: Screening) -> Bool {
        return dayOfWeek == screening.whenScreened &&
            startTime.timeIntervalSince(screening.whenScreened) <= 0 &&
            endTime.timeIntervalSince(screening.whenScreened) >= 0
    }
}
