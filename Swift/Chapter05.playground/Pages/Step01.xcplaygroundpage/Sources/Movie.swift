import Foundation


enum MovieError: Error {
    case illegal
}

public class Movie {
    public var movieType: MovieType
    public var discountAmount: Money
    public var discountPercent: Double
    public let title: String
    public let runningTime: TimeInterval
    public var fee: Money
    public var discountConditions: [DiscountCondition]
    
    
    public init(title: String, runningTime: TimeInterval, fee: Money, discountPercent: Double, discountConditions: [DiscountCondition]) {
        self.movieType = .percentDiscount
        self.fee = fee
        self.discountAmount = Money.ZERO
        self.title = title
        self.discountPercent = discountPercent
        self.runningTime = runningTime
        self.fee = fee
        self.discountConditions = discountConditions
    }
    
    public init(title: String, runningTime: TimeInterval, fee: Money, discountAmount: Money, discountConditions: [DiscountCondition]) {
        self.movieType = .amountDiscount
        self.fee = fee
        self.discountAmount = discountAmount
        self.title = title
        self.discountPercent = 0
        self.runningTime = runningTime
        self.fee = fee
        self.discountConditions = discountConditions
    }
    
    public required init(movieType: MovieType, discountAmount: Money, discountPercent: Double, title: String, runningTime: TimeInterval, fee: Money, discountConditions: [DiscountCondition]) {
        self.movieType = movieType
        self.discountAmount = discountAmount
        self.discountPercent = discountPercent
        self.title = title
        self.runningTime = runningTime
        self.fee = fee
        self.discountConditions = discountConditions
    }
    
    func calculateAmountDiscountedFee() throws -> Money {
        if movieType != MovieType.amountDiscount {
            throw MovieError.illegal
        }
        
        return fee.minus(discountAmount)
    }
    
    func calculatePercentDiscountedFee() throws -> Money {
        if movieType != MovieType.percentDiscount {
            throw MovieError.illegal
        }
        
        return fee.minus(fee.times(discountPercent))
    }
    
    func calculateNoneDiscountedFee() throws -> Money {
        if movieType != MovieType.noneDiscount {
            throw MovieError.illegal
        }
        
        return fee
    }
    
    func calculateMovieFee(screening: Screening) throws -> Money {
        if isDiscountable(screening: screening) {
            return fee.minus(try calculateDiscountAmount())
        }
        return fee
        
    }
    
    private func isDiscountable(screening: Screening) -> Bool {
        return discountConditions.first { $0.isSatisfiedBy(screening: screening) } != nil
    }
    
    private func calculateDiscountAmount() throws -> Money {
        switch movieType {
        case .amountDiscount:
            return try calculateDiscountAmount()
        case .percentDiscount:
            return try calculatePercentDiscountedFee()
        case .noneDiscount:
            return try calculateNoneDiscountedFee()
        }
    }
    
    private func calculateAmountDiscountAmount() -> Money {
        return discountAmount
    }
    
    private func calculatePercentDiscountAmount() -> Money {
        return fee.times(discountPercent)
    }
    
    private func calculateNoneDiscountAmount() -> Money {
        return Money.ZERO
    }
}
