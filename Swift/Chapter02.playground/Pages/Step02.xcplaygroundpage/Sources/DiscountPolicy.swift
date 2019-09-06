import Foundation

public protocol DiscountPolicy {
    func calculateDiscountAmount(_ screening: Screening) -> Money
}
