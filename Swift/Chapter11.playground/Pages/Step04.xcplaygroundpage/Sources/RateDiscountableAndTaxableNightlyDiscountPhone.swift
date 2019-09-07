import Foundation

class RateDiscountableAndTaxableNightlyDiscountPhone: RateDiscountableNightlyDiscountPhone {
    
    private let taxRate: Double
    
    public init(nightlyAmount: Money, regularAmount: Money, seconds: TimeInterval, discountAmount: Money, taxRate: Double) {
        self.taxRate = taxRate
        super.init(nightlyAmount: nightlyAmount, regularAmount: regularAmount, seconds: seconds, discountAmount: discountAmount)
    }
    
    
    public override func afterCalculated(fee: Money) -> Money {
        return super.afterCalculated(fee: fee).plus(fee.times(taxRate))
    }
}
