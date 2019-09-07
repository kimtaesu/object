import Foundation

public class TaxableRegularPhone: RegularPhone {
    
    private let taxRate: Double
    
    public init(amount: Money, seconds: TimeInterval, taxRate: Double) {
        self.taxRate = taxRate
        super.init(amount: amount, seconds: seconds)
    }
    override func calculateFee() -> Money {
        let fee = super.calculateFee()
        return fee.plus(fee.times(taxRate))
    }
}
