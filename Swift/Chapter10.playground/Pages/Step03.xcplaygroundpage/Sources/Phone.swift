import Foundation



public class Phone {

    static let LATE_NIGHT_HOUR = 22

    private let type: PhoneType
    private let amount: Money
    private let seconds: TimeInterval
    private let nightlyAmount: Money
    private let regularAmount: Money



    private var calls = [Call]()

    internal enum PhoneType {
        case regular
        case nightly
    }


    public init(amount: Money, seconds: TimeInterval) {
        self.amount = amount
        self.seconds = seconds
        self.type = .regular
        self.nightlyAmount = Money.ZERO
        self.regularAmount = Money.ZERO
    }

    public init(seconds: TimeInterval, amount: Money, nightlyAmount: Money, regularAmount: Money) {
        self.seconds = seconds
        self.nightlyAmount = nightlyAmount
        self.regularAmount = regularAmount
        self.type = .nightly
        self.amount = amount
    }

    public func calculateFee() -> Money {
        if seconds.seconds <= 0 { return Money.ZERO }
        var result = Money.ZERO

        let calendar = Calendar.current

        for call in calls {
            if (type == .regular) {
                result = result.plus(amount.times(Double(call.duration.seconds / seconds.seconds)))
            } else {
                let hour = calendar.component(.hour, from: call.from)
                if hour >= Phone.LATE_NIGHT_HOUR {
                    result =
                        result.plus(nightlyAmount.times(Double(call.duration.seconds / seconds.seconds)))
                } else {
                    result =
                        result.plus(regularAmount.times(Double(call.duration.seconds / seconds.seconds)))
                }
            }
        }

        return result
    }
}
