import Foundation

public class RegularPhone: Phone {

    let amount: Money
    let seconds: TimeInterval

    public init(amount: Money, seconds: TimeInterval, taxRate: Double) {
        self.amount = amount
        self.seconds = seconds
        super.init(taxRate: taxRate)
    }

    override public func calculateCallFee(call: Call) -> Money {
        if seconds.seconds <= 0 { return Money.ZERO }
        return amount.times(Double(call.duration.seconds / seconds.seconds))
    }
}
