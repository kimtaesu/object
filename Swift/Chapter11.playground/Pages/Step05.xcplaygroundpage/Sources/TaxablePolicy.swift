import Foundation

class TaxablePolicy: AdditionalRatePolicy {
    
    private let taxRatio: Double
    
    public init(taxRatio: Double, next: RatePolicy) {
        self.taxRatio = taxRatio
        super.init(next: next)
    }
    override public func afterCalculated(fee: Money) -> Money {
        return fee.plus(fee.times(taxRatio))
    }
}
