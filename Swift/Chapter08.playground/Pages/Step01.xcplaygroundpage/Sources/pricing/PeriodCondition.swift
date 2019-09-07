import Foundation


public struct PeriodCondition: DiscountCondition {
    
    let dayOfWeek: Date
    let startTime: Date
    let endTime: Date
    
    public init(dayOfWeek: Date, startTime: Date, endTime: Date) {
        self.dayOfWeek = dayOfWeek
        self.startTime = startTime
        self.endTime = endTime
    }
    
    public func isSatisfiedBy(_ screening: Screening) -> Bool {
        return dayOfWeek == screening.dayOfWeek &&
            startTime == screening.startTime  &&
            endTime == screening.endTime
    }
}
