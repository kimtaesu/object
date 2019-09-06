import Foundation

public class ReservationAgency {
    public func reserve(screening: Screening, customer: Customer, audienceCount: Int) -> Reservation {
        let movie = screening.movie
        
        var discountable = false
        for condition in movie.discountConditions {
            if (condition.type == DiscountConditionType.period) {
                discountable = screening.whenScreened == condition.dayOfWeek &&
                    condition.startTime.timeIntervalSince(screening.whenScreened) <= 0 &&
                    condition.endTime.timeIntervalSince(screening.whenScreened) >= 0
            } else {
                discountable = condition.sequence == screening.sequence
            }
            
            if discountable {
                break
            }
        }
        
        var fee: Money
        if discountable {
            var discountAmount = Money.ZERO
            switch movie.movieType {
            case .amountDiscount:
                discountAmount = movie.discountAmount
            case .percentDiscount:
                discountAmount = movie.fee.times(movie.discountPercent)
            case .noneDiscount:
                discountAmount = Money.ZERO
            }
            fee = movie.fee.minus(discountAmount).times(Double(audienceCount))
        } else {
            fee = movie.fee
        }
        
        return Reservation(customer: customer, screening: screening, fee: fee, audienceCount: audienceCount)
    }
}

