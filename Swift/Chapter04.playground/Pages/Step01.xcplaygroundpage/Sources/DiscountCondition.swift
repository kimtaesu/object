import Foundation

public struct DiscountCondition {
    public var type: DiscountConditionType? = nil
    public var sequence: Int
    public var dayOfWeek: Date
    public var startTime: Date
    public var endTime: Date
}
