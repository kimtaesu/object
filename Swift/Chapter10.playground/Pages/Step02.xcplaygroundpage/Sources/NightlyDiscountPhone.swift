import Foundation


public class NightlyDiscountPhone {
    static let LATE_NIGHT_HOUR = 22

    private let nightlyAmount: Money
    private let regularAmount: Money
    private let seconds: TimeInterval
    private let taxRate: Double

    private let calls = [Call]()

    public init(nightlyAmount: Money, regularAmount: Money, seconds: TimeInterval, taxRate: Double) {
        self.nightlyAmount = nightlyAmount
        self.regularAmount = regularAmount
        self.seconds = seconds
        self.taxRate = taxRate
    }


    public func calculateFee() -> Money {
        if seconds.seconds <= 0 { return Money.ZERO }
        var result = Money.ZERO

        let calendar = Calendar.current
        for call in calls {
            let hour = calendar.component(.hour, from: call.from)
            if hour >= NightlyDiscountPhone.LATE_NIGHT_HOUR {
                result = result.plus(nightlyAmount.times(Double(call.duration.seconds / seconds.seconds)))
            } else {
                result = result.plus(regularAmount.times(Double(call.duration.seconds / seconds.seconds)))
            }
        }

        return result.minus(result.times(taxRate))
    }
}
