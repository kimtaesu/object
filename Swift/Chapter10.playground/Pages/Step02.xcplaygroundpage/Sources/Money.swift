import Foundation

public class Money {
    
    private let amount: Int
    
    public init(_ amount: Int) {
        self.amount = amount
    }
    
    func plus(_ amount: Money) -> Money {
        return Money(amount.amount + amount.amount)
    }
    
    func minus(_ amount: Money) -> Money {
        
        return Money(self.amount - amount.amount)
    }
    
    func times(_ percent: Double) -> Money {
        return Money(self.amount * Int(percent))
    }
    
    func isLessThan(_ other: Money) -> Bool {
        return amount.advanced(by: -other.amount) < 0
    }
    
    func isGreaterThanOrEqual(_ other: Money) -> Bool {
        return amount.advanced(by: -other.amount) >= 0
    }
    
    func wons(amount: Int) -> Money {
        return Money(amount)
    }
    
    func wons(amount: Double) -> Money {
        return Money(Int(amount))
    }
}

extension Money: CustomStringConvertible {
    public var description: String {
        return "\(amount)원"
    }
    public static var ZERO: Money {
        return Money(0)
    }
}

extension Money: Hashable, Equatable {
    public static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs.amount == rhs.amount
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.amount)
    }
}
