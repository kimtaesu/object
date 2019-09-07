import Foundation


public struct SequenceCondition : DiscountCondition {
    
    private let sequence: Int
    
    public init(sequence: Int ) {
        self.sequence = sequence
    }
    
    public func isSatisfiedBy(_ screening: Screening) -> Bool {
        return screening.isSequence(sequence)
    }
}
