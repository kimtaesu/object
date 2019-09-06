import Foundation

class AmountDiscountMovie: Movie {
    private let discountAmount: Money
    
    public init(title: String, runningTime: TimeInterval, fee: Money, discountConditions: [DiscountCondition], discountAmount: Money) {
        self.discountAmount = discountAmount
        super.init(title: title, runningTime: runningTime, fee: fee, discountConditions: discountConditions)
    }
    override func calculateDiscountAmount() -> Money {
        return discountAmount
    }
}
