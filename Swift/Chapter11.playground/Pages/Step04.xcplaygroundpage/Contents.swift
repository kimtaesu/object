//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
RateDiscountableRegularPhone(amount: Money(10), seconds: 0, discountAmount: Money(1)).afterCalculated(fee: Money(2))

TaxableAndDiscountableNightlyDiscountPhone(nightlyAmount: Money.ZERO, regularAmount: Money.init(0), seconds: 0, discountAmount: Money(1), taxRate: 0).calculateCallFee(call: Call(from: Date(), to: Date()))
