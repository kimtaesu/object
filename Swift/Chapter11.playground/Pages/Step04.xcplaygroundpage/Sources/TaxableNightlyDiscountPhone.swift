import Foundation

public class TaxableNightlyDiscountPhone: NightlyDiscountPhone {
    private let taxRate: Double
    
    public init(nightlyAmount: Money, regularAmount: Money, seconds: TimeInterval, taxRate: Double) {
        self.taxRate = taxRate
        super.init(nightlyAmount: nightlyAmount, regularAmount: regularAmount, seconds: seconds)
    }
    
    
    public override func afterCalculated(fee: Money) -> Money {
        return super.afterCalculated(fee: fee).plus(fee.times(taxRate))
    }
}
