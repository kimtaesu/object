import Foundation

public class AbstractPhone {
    private var calls = [Call]();
    
    public func calculateFee() -> Money {
        var result = Money.ZERO
        
        for call in calls {
            result = result.plus(calculateCallFee(call: call))
        }
        
        return result
    }
    
    func calculateCallFee(call: Call) -> Money {
        fatalError("Not Implements")
    }
}
