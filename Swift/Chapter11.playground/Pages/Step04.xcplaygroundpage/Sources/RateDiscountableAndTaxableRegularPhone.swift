import Foundation


class RateDiscountableAndTaxableRegularPhone: RateDiscountableRegularPhone {
    
    private let taxRate: Double
    
    public init(amount: Money, seconds: TimeInterval, discountAmount: Money, taxRate: Double) {
        self.taxRate = taxRate
        super.init(amount: amount, seconds: seconds, discountAmount: discountAmount)
        
    }
    
    public override func afterCalculated(fee: Money) -> Money {
        return super.afterCalculated(fee: fee).plus(fee.times(taxRate))
    }
}



