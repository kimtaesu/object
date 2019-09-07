import Foundation

public class OverlappedDiscountPolicy: DiscountPolicy {
    private let discountPolicies: [DiscountPolicy]
    
    public init(discountPolicies: [DiscountPolicy]) {
        self.discountPolicies = discountPolicies
    }
    
    override public func getDiscountAmount(screening: Screening) -> Money {
        var result = Money.ZERO
        for each in discountPolicies {
            result = result.plus(each.calculateDiscountAmount(screening: screening))
        }
        return result
    }
}
