import Foundation

public class RateDiscountablePolicy: AdditionalRatePolicy {
    private let discountAmount: Money
    
    public init(discountAmount: Money, next: RatePolicy) {
        self.discountAmount = discountAmount
        super.init(next: next)
    }
    
    override public func afterCalculated(fee: Money) -> Money {
        return fee.minus(discountAmount)
    }
}
