import Foundation

public protocol DiscountCondition {
    func isSatisfiedBy(_ screening: Screening) -> Bool
}
