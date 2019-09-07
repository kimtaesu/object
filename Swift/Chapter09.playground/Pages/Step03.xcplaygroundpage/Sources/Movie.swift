import Foundation

enum MovieError: Error {
    case noDiscountPolicy
}
public struct Movie {
    let title: String
    let runningTime: TimeInterval
    let discountPolicy: DiscountPolicy?
    let fee: Money
    
    public init(title: String, runningTime: TimeInterval, discountPolicy: DiscountPolicy, fee: Money) {
        self.title = title
        self.runningTime = runningTime
        self.discountPolicy = ServiceLocator.getDiscountPolicy()
        self.fee = fee
    }
    
    public func calculateMovieFee(_ screening: Screening) throws -> Money {
        guard let discountPolicy = discountPolicy else { throw MovieError.noDiscountPolicy }
        return fee.minus(discountPolicy.calculateDiscountAmount(screening: screening))
    }
}
