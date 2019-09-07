import Foundation

public class Phone {
    
    private var calls = [Call]();
    
    public init() {
    }
    
    func calculateFee() -> Money {
        var result = Money.ZERO
        
        for call in calls {
            result = result.plus(calculateCallFee(call: call))
        }
        
        return afterCalculated(fee: result)
    }
    
    func calculateCallFee(call: Call) -> Money {
        fatalError("Not Implements")
    }
    
    func afterCalculated(fee: Money) -> Money {
        fatalError("Not Implements")
    }
}
