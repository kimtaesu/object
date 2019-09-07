import Foundation


public class Phone {
    let amount: Money
    public let seconds: TimeInterval
    let taxRate: Double
    
    private var calls = [Call]()
    
    public init(amount: Money, seconds: TimeInterval, taxRate: Double) {
        self.amount = amount
        self.seconds = seconds
        self.taxRate = taxRate
    }
    
    public  func call(call: Call) {
        calls.append(call)
    }
    
    public func getCalls() -> [Call] {
        return calls
    }
    
    public func calculateFee() -> Money {
        var result = Money.ZERO
        
        for call in calls {
            result = result.plus(amount.times(Double(call.duration.seconds / seconds.seconds)))
        }
        
        return result.plus(result.times(self.taxRate))
    }
}
