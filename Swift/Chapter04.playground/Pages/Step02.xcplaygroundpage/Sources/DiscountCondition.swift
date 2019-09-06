import Foundation

public struct DiscountCondition {
    public var type: DiscountConditionType? = nil
    public var sequence: Int
    public var dayOfWeek: Date
    public var startTime: Date
    public var endTime: Date
    
    func isDiscountable(dayOfWeek: Date, time: Date) throws -> Bool {
        if (type != DiscountConditionType.period) {
            throw MovieError.illegal
        }
        
        return self.dayOfWeek == dayOfWeek &&
            self.startTime.timeIntervalSince(time) <= 0 &&
            self.endTime.timeIntervalSince(time) >= 0
    }
    
    func isDiscountable(sequence: Int) throws -> Bool {
        if (type != DiscountConditionType.sequence) {
            throw MovieError.illegal
        }
        
        return self.sequence == sequence
    }
}
