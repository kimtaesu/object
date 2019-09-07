import Foundation

public struct Reservation {
    var customer: Customer?
    var screening: Screening?
    var fee: Money?
    var audienceCount: Int
}

