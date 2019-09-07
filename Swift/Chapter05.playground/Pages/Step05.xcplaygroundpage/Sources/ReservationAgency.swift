import Foundation


class ReservationAgency {
    func reserve(
        screening: Screening,
        customer: Customer,
        audienceCount: Int
    ) -> Reservation {
        let discountable = checkDiscountable(screening: screening)
        let fee = calculateFee(screening: screening, discountable: discountable, audienceCount: audienceCount)
        return createReservation(screening: screening, customer: customer, audienceCount: audienceCount, fee: fee)
    }

    private func checkDiscountable(screening: Screening) -> Bool {
        return true
    }

    private func calculateFee(
        screening: Screening,
        discountable: Bool,
        audienceCount: Int
    ) -> Money {
        if discountable {
            return screening.movie.fee.minus(calculateDiscountedFee(movie: screening.movie))
                .times(Double(audienceCount))
        }
        return screening.movie.fee
    }

    private func calculateDiscountedFee(movie: Movie) -> Money {
        switch movie.movieType {
        case .amountDiscount:
            return calculateDiscountedFee(movie: movie)
        case .percentDiscount:
            return calculatePercentDiscountedFee(movie: movie)
        case .noneDiscount:
            return calculateNoneDiscountedFee(movie: movie)
        }
    }

    private func calculateAmountDiscountedFee(movie: Movie) -> Money {
        return movie.discountAmount
    }

    private func calculatePercentDiscountedFee(movie: Movie) -> Money {
        return movie.fee.times(movie.discountPercent)
    }

    private func calculateNoneDiscountedFee(movie: Movie) -> Money {
        return movie.fee
    }

    private func createReservation(
        screening: Screening,
        customer: Customer,
        audienceCount: Int,
        fee: Money
    ) -> Reservation {
        return Reservation(
            customer: customer,
            screening: screening,
            fee: fee,
            audienceCount: audienceCount
        )
    }
}
