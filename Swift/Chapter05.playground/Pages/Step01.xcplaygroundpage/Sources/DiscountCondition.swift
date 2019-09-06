import Foundation


public struct DiscountCondition {
    public var type: DiscountConditionType? = nil
    public var sequence: Int
    public var dayOfWeek: Date
    public var startTime: Date
    public var endTime: Date
    
    func isSatisfiedBy(screening: Screening) -> Bool {
        if type == DiscountConditionType.period {
            return isSatisfiedByPeriod(screening: screening)
        }
        return isSatisfiedBySequence(screening: screening)
    }
    
    private func isSatisfiedByPeriod(screening: Screening) -> Bool {
        return dayOfWeek == screening.whenScreened &&
            startTime.timeIntervalSince(screening.whenScreened) <= 0 &&
            endTime.timeIntervalSince(screening.whenScreened) <= 0
    }
    
    private func isSatisfiedBySequence(screening: Screening) -> Bool {
        return sequence == screening.sequence
    }
}
