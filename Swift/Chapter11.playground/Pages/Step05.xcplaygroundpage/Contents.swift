//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
RegularPhone(amount: Money.ZERO, seconds: 0).calculateCallFee(call: Call(from: Date(), to: Date()))
NightlyDiscountPhone(nightlyAmount: Money.ZERO, regularAmount: Money.ZERO, seconds: 0).calculateCallFee(call: Call(from: Date(), to: Date()))
TaxableRegularPhone(amount: Money.ZERO, seconds: 0, taxRate: 0).calculateCallFee(call: Call(from: Date(), to: Date()))
RateDiscountablePolicy(discountAmount: Money(100), next: RegularPolicy(amount: Money(10), seconds: 0))
