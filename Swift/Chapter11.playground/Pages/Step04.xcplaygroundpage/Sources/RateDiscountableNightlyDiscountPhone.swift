import Foundation


public class RateDiscountableNightlyDiscountPhone: NightlyDiscountPhone {
    
    private let discountAmount: Money
    
    public init(nightlyAmount: Money, regularAmount: Money, seconds: TimeInterval, discountAmount: Money) {
        self.discountAmount = discountAmount
        super.init(nightlyAmount: nightlyAmount, regularAmount: regularAmount, seconds: seconds)
    }
    
    override public func afterCalculated(fee: Money) -> Money {
        return fee.minus(discountAmount)
    }
}
