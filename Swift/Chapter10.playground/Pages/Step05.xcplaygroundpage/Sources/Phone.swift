import Foundation


public class Phone {
    
    let amount: Money
    let seconds: TimeInterval
    let taxRate: Double
    
    private var calls = [Call]()
    
    public init(amount: Money, seconds: TimeInterval, taxRate: Double) {
        self.amount = amount
        self.seconds = seconds
        self.taxRate = taxRate
    }
    
    func calculateFee() -> Money {
        var result = Money.ZERO
        
        for call in calls {
            result = result.plus(amount.times(Double(call.duration.seconds / seconds.seconds)))
        }
        
        return result.plus(result.times(taxRate))
    }
}
