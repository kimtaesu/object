import Foundation

class Client {
    var avatarFee: Money {
        let avatar = Movie(
            title: "아바타",
            runningTime: TimeInterval(TimeInterval(120).minutes),
            discountPolicy: AmountDiscountPolicy(
                Money.wons(amount: 800),
                [SequenceCondition(sequence: 1), SequenceCondition(sequence: 10)]
            ),
            fee: Money.wons(amount: 1000)
        )
        return avatar.fee
    }
}
