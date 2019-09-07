import Foundation


public class BasicRatePolicy: RatePolicy {
    public func calculateFee(phone: Phone) -> Money {
        var result = Money.ZERO
        
        for call in phone.getCalls() {
            result = result.plus(calculateCallFee(call: call))
        }
        
        return result
    }
    
    func calculateCallFee(call: Call) -> Money {
        fatalError("Not Implements")
    }
}
