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
}
