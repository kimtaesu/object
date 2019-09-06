import Foundation


public protocol DiscountPolicy {
    var conditions: [DiscountCondition] { get }

    func getDiscountAmount(_ Screening: Screening) -> Money
}

extension DiscountPolicy {
    func calculateDiscountAmount(_ screening: Screening) -> Money {
        for each in conditions {
            if each.isSatisfiedBy(screening) {
                return getDiscountAmount(screening)
            }
        }

        return Money.ZERO
    }
}
