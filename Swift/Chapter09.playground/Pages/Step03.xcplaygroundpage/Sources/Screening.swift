import Foundation


public class Screening {
    let movie: Movie
    let sequence: Int
    let startTime: Date
    let dayOfWeek: Date
    let endTime: Date
    
    public init(movie: Movie, sequence: Int, startTime: Date, dayOfWeek: Date, endTime: Date) {
        self.movie = movie
        self.sequence = sequence
        self.startTime = startTime
        self.dayOfWeek = dayOfWeek
        self.endTime = endTime
    }
    
    public func isSequence(_ sequence: Int) -> Bool {
        return self.sequence == sequence
    }
    
    public func reserve(_ customer: Customer, _ audienceCount: Int) throws -> Reservation {
        return Reservation(customer: customer, Screening: self, fee: try calculateFee(audienceCount), audienceCount: audienceCount)
    }
    
    
    private func calculateFee(_ audienceCount: Int) throws -> Money {
        return try movie.calculateMovieFee(self).times(Double(audienceCount))
    }
    
    public var movieFee: Money {
        return movie.fee
    }
}

