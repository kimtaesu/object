import Foundation


public protocol MovieDiscountable {
    func calculateDiscountAmount() -> Money
}

public class Movie : MovieDiscountable {
    
    let title: String
    let runningTime: TimeInterval
    let fee: Money
    let discountConditions: [DiscountCondition]
    
    
    public init(title: String, runningTime: TimeInterval, fee: Money, discountConditions: [DiscountCondition]) {
        self.title = title
        self.runningTime = runningTime
        self.fee = fee
        self.discountConditions = discountConditions
    }
    
    
    func calculateMovieFee(screening: Screening) throws -> Money {
        if isDiscountable(screening: screening) {
            return fee.minus(calculateDiscountAmount())
        }
        return fee
        
    }
    
    private func isDiscountable(screening: Screening) -> Bool {
        return discountConditions.first { $0.isSatisfiedBy(screening: screening) } != nil
    }
    
    public func calculateDiscountAmount() -> Money {
        fatalError("Not implements")
    }
}
