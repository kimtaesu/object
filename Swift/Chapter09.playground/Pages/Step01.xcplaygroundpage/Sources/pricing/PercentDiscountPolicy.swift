import Foundation

public class PercentDiscountPolicy: DiscountPolicy {
    
    private let percent: Double
    public var conditions: [DiscountCondition]
    
    public init(percent: Double, conditions: [DiscountCondition]) {
        self.percent = percent
        self.conditions = conditions
    }
    
    public func getDiscountAmount(_ screening: Screening) -> Money {
        return screening.movieFee.times(percent)
    }
}
