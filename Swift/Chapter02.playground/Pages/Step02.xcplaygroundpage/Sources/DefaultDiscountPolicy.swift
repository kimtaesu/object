import Foundation


public protocol DefaultDiscountPolicy {
    var conditions: [DiscountCondition] { get }

    func getDiscountAmount(_ Screening: Screening) -> Money
}

extension DefaultDiscountPolicy {
    func calculateDiscountAmount(_ screening: Screening) -> Money {
        for each in conditions {
            if each.isSatisfiedBy(screening) {
                return getDiscountAmount(screening)
            }
        }

        return Money.ZERO
    }
}
