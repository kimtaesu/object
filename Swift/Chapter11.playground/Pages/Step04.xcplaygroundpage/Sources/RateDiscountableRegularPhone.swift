import Foundation

public class RateDiscountableRegularPhone: RegularPhone {
    
    private let discountAmount: Money
    
    public init(amount: Money, seconds: TimeInterval, discountAmount: Money) {
        self.discountAmount = discountAmount
        super.init(amount: amount, seconds: seconds)
        
    }
    
    override public func afterCalculated(fee: Money) -> Money {
        return fee.minus(discountAmount)
    }
}
