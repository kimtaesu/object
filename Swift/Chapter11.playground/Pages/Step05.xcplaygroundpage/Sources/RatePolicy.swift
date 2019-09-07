import Foundation


public protocol RatePolicy {
    func calculateFee(phone: Phone) -> Money
}
