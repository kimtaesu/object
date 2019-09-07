import Foundation


public class NightlyDiscountPhone: Phone {
    static let LATE_NIGHT_HOUR = 22
    
    private let nightlyAmount: Money
    
    public init(nightlyAmount: Money, regularAmount: Money, seconds: TimeInterval) {
        self.nightlyAmount = nightlyAmount
        super.init(amount: regularAmount, seconds: seconds)
    }
    
    private let calls = [Call]()
    
    public override func calculateFee() -> Money {
        // 부모클래스의 calculateFee 호출
        var result = super.calculateFee()
        
        var nightlyFee = Money.ZERO
        
        let calendar = Calendar.current
        for call in calls {
            let hour = calendar.component(.hour, from: call.from)
            if hour >= NightlyDiscountPhone.LATE_NIGHT_HOUR {
                nightlyFee = nightlyFee.plus(
                    amount.minus(nightlyAmount).times(
                        Double(call.duration.seconds / seconds.seconds)
                    )
                )
                result = result.plus(nightlyAmount.times(Double(call.duration.seconds / seconds.seconds)))
            }
        }
        return result.minus(nightlyFee)
    }
}
