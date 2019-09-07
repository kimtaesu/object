import Foundation


import Foundation


public class Movie {
    private let title: String
    private let runningTime: TimeInterval
    private let fee: Money
    private let periodConditions: [PeriodCondition]
    private let sequenceConditions: [SequenceCondition]
    
    private var movieType: MovieType = MovieType.noneDiscount
    private var discountAmount: Money = Money.ZERO
    private var discountPercent: Double = 0
    
    public init(title: String, runningTime: TimeInterval, fee: Money, periodConditions: [PeriodCondition], sequenceConditions: [SequenceCondition]) {
        self.title = title
        self.runningTime = runningTime
        self.fee = fee
        self.periodConditions = periodConditions
        self.sequenceConditions = sequenceConditions
    }
    private func checkPeriodConditions(screening: Screening) -> Bool {
        return periodConditions.first { $0.isSatisfiedBy(screening: screening) } != nil
    }
    
    private func checkSequenceConditions(screening: Screening) -> Bool {
        return sequenceConditions.first { $0.isSatisfiedBy(screening: screening) } != nil
    }
    func calculateMovieFee(screening: Screening) throws -> Money {
        if isDiscountable(screening: screening) {
            return fee.minus(try calculateDiscountAmount())
        }
        return fee
        
    }
    
    private func isDiscountable(screening: Screening) -> Bool {
        return checkPeriodConditions(screening: screening) ||
            checkSequenceConditions(screening: screening)
    }
    
    private func calculateDiscountAmount() throws -> Money {
        switch movieType {
        case .amountDiscount:
            return calculateAmountDiscountAmount()
        case .percentDiscount:
            return calculatePercentDiscountAmount()
        case .noneDiscount:
            return calculateNoneDiscountAmount()
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
