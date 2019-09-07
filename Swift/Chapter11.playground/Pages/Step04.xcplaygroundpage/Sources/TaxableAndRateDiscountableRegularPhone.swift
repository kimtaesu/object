import Foundation

public class TaxableAndRateDiscountableRegularPhone: TaxableNightlyDiscountPhone {
    private let discountAmount: Money
    
    public init(nightlyAmount: Money, regularAmount: Money, seconds: TimeInterval, discountAmount: Money, taxRate: Double) {
        self.discountAmount = discountAmount
        super.init(nightlyAmount: nightlyAmount, regularAmount: regularAmount, seconds: seconds, taxRate: taxRate)
    }
    
    
    public override func afterCalculated(fee: Money) -> Money {
        return super.afterCalculated(fee: fee).minus(discountAmount)
    }
}
