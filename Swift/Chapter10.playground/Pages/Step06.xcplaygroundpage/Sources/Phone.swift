import Foundation


public class Phone: AbstractPhone {
    
    let amount: Money
    let seconds: TimeInterval
    
    public init(amount: Money, seconds: TimeInterval) {
        self.amount = amount
        self.seconds = seconds
    }
    
    override func calculateCallFee(call: Call) -> Money {
        return amount.times(Double(call.duration.seconds / seconds.seconds))
    }
}
