import Foundation


public class NightlyDiscountPhone: AbstractPhone {
    static let LATE_NIGHT_HOUR = 22
    
    private let nightlyAmount: Money
    private let regularAmount: Money
    private let seconds: TimeInterval
    
    public init(nightlyAmount: Money, regularAmount: Money, seconds: TimeInterval) {
        self.nightlyAmount = nightlyAmount
        self.regularAmount = regularAmount
        self.seconds = seconds
    }
    
    public override func calculateCallFee(call: Call) -> Money {
        let hour = Calendar.current.component(.hour, from: call.from)
        if hour >= NightlyDiscountPhone.LATE_NIGHT_HOUR {
            return nightlyAmount.times(Double(call.duration.seconds / seconds.seconds))
        } else {
            return regularAmount.times(Double(call.duration.seconds / seconds.seconds))
        }
    }
}
