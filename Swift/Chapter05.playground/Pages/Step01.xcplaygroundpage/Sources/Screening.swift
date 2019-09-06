import Foundation


public struct Screening {
    public var movie: Movie
    public var sequence: Int
    public var whenScreened: Date
    
    func reserve(
        customer: Customer,
        audienceCount: Int
        ) throws -> Reservation {
        return Reservation(
            customer: customer,
            screening: self,
            fee: try calculateFee(audienceCount: audienceCount),
            audienceCount: audienceCount
        )
    }
    
    func calculateFee(audienceCount: Int) throws -> Money {
        return try movie.calculateMovieFee(screening: self).times(Double(audienceCount))
    }
}
