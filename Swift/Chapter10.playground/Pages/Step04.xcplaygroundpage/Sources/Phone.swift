import Foundation



public class Phone {
    
    let amount: Money
    let seconds: TimeInterval
    
    private var calls = [Call]()
    
    public init(amount: Money, seconds: TimeInterval) {
        self.amount = amount
        self.seconds = seconds
    }
    
    func calculateFee() -> Money {
        var result = Money.ZERO
        
        for call in calls {
            result = result.plus(amount.times(Double(call.duration.seconds / seconds.seconds)))
        }
        
        return result
    }
}
