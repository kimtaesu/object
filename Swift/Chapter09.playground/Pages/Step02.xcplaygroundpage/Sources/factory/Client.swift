import Foundation

public class Client {
    private let factory: Factory
    
    public init(factory: Factory) {
        self.factory = factory
    }
    
    public func getAvatarFee() -> Money {
        return factory.createAvatarMovie().fee
    }
}
