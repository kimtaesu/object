import Foundation


public struct DiscountCondition {
    public let type: DiscountConditionType
    public let sequence: Int
    
    
    public var dayOfWeek: Date? = nil
    public var startTime: Date? = nil
    public var endTime: Date? = nil
    
    public init(sequence: Int) {
        self.type = .sequence
        self.sequence = sequence
    }
    
    public init(dayOfWeek: Date, startTime: Date, endTime: Date) {
        self.type = .period
        self.sequence = 0
        self.dayOfWeek = dayOfWeek
        self.startTime = startTime
        self.endTime = endTime
    }
    
    func isDiscountable(screening: Screening) throws -> Bool {
        if (type == DiscountConditionType.period) {
            return isSatisfiedByPeriod(screening: screening)
        }
        
        return isSatisfiedByPeriod(screening: screening)
    }
    
    private func isSatisfiedByPeriod(screening: Screening) -> Bool {
        guard let dayOfWeek = dayOfWeek,
            let startTime = startTime,
            let endTime = endTime else { return false }
        return dayOfWeek == screening.whenScreened &&
            startTime.timeIntervalSince(screening.whenScreened) <= 0 &&
            endTime.timeIntervalSince(screening.whenScreened) <= 0
    }
}
