import Foundation


public  struct SequenceCondition {
    
    let sequence: Int
    
    public init(sequence: Int) {
        self.sequence = sequence
    }
    
    func isSatisfiedBy(screening: Screening) -> Bool {
        return sequence == screening.sequence
    }
}
