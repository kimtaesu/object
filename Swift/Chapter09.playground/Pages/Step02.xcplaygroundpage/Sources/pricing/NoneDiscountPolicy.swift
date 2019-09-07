import Foundation

public class NoneDiscountPolicy: DiscountPolicy {
    public var conditions: [DiscountCondition] = []
    
    public func getDiscountAmount(_ screening: Screening) -> Money {
        return Money.ZERO
    }
}
