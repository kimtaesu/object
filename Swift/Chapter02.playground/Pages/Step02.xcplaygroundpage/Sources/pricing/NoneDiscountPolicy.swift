import Foundation

public class NoneDiscountPolicy: DefaultDiscountPolicy {
    public var conditions: [DiscountCondition] = []
    
    public func getDiscountAmount(_ screening: Screening) -> Money {
        return Money.ZERO
    }
}
