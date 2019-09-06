import Foundation

struct ReservationAgency {
    func reserve(
        screening: Screening,
        customer: Customer,
        audienceCount: Int
        ) throws  -> Reservation {
        let fee = try screening.calculateFee(audienceCount: audienceCount)
        return Reservation(
            customer: customer,
            screening: screening,
            fee: fee,
            audienceCount: audienceCount
        )
    }
}
