import Foundation

public class Phone {
    let taxRate: Double
    
    private var calls = [Call]();
    
    public init(taxRate: Double) {
        self.taxRate = taxRate
    }
    
    func calculateFee() -> Money {
        var result = Money.ZERO
        
        for call in calls {
            result = result.plus(calculateCallFee(call: call))
        }
        
        return result.plus(result.times(taxRate))
    }
    
    func calculateCallFee(call: Call) -> Money {
        fatalError("Not Implements")
    }
}
