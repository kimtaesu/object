import Foundation


public class AmountDiscountPolicy: DiscountPolicy {
    
    private let discountAmount: Money
    
    public var conditions: [DiscountCondition] = []
    
    public init(_ discountAmount: Money, _ conditions: [DiscountCondition]) {
        self.discountAmount = discountAmount
        self.conditions = conditions
    }
    public func getDiscountAmount(_ screening: Screening) -> Money {
        return discountAmount
    }
}
