import Foundation

public class AdditionalRatePolicy: RatePolicy {
    
    private let next: RatePolicy
    
    public init(next: RatePolicy) {
        self.next = next
    }
    
    public func calculateFee(phone: Phone) -> Money {
        let fee = next.calculateFee(phone: phone)
        return afterCalculated(fee: fee)
    }
    
    public func afterCalculated(fee: Money) -> Money {
        fatalError("Not Implements")
    }
}
