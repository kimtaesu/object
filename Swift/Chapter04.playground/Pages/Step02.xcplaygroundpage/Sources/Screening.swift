import Foundation


public struct Screening {
    public var movie: Movie
    public var sequence: Int
    public var whenScreened: Date
    
    func calculateFee(audienceCount: Int) throws -> Money {
        switch movie.movieType {
        case .amountDiscount:
            if try movie.isDiscountable(whenScreened: whenScreened, sequence: sequence) {
                return try movie.calculateAmountDiscountedFee().times(Double(audienceCount))
            }
        case .percentDiscount:
            if try movie.isDiscountable(whenScreened: whenScreened, sequence: sequence) {
                return try movie.calculatePercentDiscountedFee().times(Double(audienceCount))
            }
        case .noneDiscount:
            return try movie.calculateNoneDiscountedFee().times(Double(audienceCount))
        }
        
        return try movie.calculateNoneDiscountedFee().times(Double(audienceCount))
    }
}
