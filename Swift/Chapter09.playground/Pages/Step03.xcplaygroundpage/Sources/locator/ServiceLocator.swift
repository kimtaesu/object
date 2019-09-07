import Foundation

public class ServiceLocator {
    
    public static let instance = ServiceLocator()
    
    static var discountPolicy: DiscountPolicy? = nil
    
    public static func provide(discountPolicy: DiscountPolicy) {
        self.discountPolicy = discountPolicy
    }
    
    public static func getDiscountPolicy() -> DiscountPolicy? {
        return self.discountPolicy
    }
}
