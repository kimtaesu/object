import Foundation


public class DiscountPolicy {
    private let conditions: [DiscountCondition]
    
    public init(conditions: [DiscountCondition] = []) {
        self.conditions = conditions
    }
    
    
    func calculateDiscountAmount(screening: Screening) -> Money {
        for each in conditions {
            if (each.isSatisfiedBy(screening)) {
                return getDiscountAmount(screening: screening)
            }
        }
        
        return screening.movieFee
    }
    
    func getDiscountAmount(screening: Screening) -> Money {
        fatalError("Not Implements")
    }
}
