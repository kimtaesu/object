import Foundation


public struct Movie {
    let title: String
    let runningTime: TimeInterval
    let discountPolicy: DiscountPolicy
    let fee: Money
    
    public init(title: String, runningTime: TimeInterval, discountPolicy: DiscountPolicy, fee: Money) {
        self.title = title
        self.runningTime = runningTime
        self.discountPolicy = discountPolicy
        self.fee = fee
    }
    
    func calculateMovieFee(_ screening: Screening) -> Money {
        return fee.minus(discountPolicy.calculateDiscountAmount(screening: screening))
    }
}
