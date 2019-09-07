import Foundation

public class Factory {
    public init() {
        
    }
    func createAvatarMovie() -> Movie {
        return Movie(
            title: "아바타",
            runningTime: TimeInterval(TimeInterval(120).minutes),
            discountPolicy: AmountDiscountPolicy(
                Money.wons(amount: 800),
                [SequenceCondition(sequence: 1), SequenceCondition(sequence: 10)]
            ),
            fee: Money.wons(amount: 1000)
        )
    }
}
