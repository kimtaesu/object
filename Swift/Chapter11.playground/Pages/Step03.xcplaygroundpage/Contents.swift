//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

RegularPhone(amount: Money.ZERO, seconds: 0).calculateCallFee(call: Call(from: Date(), to: Date()))
NightlyDiscountPhone(nightlyAmount: Money.ZERO, regularAmount: Money.ZERO, seconds: 0).calculateCallFee(call: Call(from: Date(), to: Date()))
TaxableRegularPhone(amount: Money.ZERO, seconds: 0, taxRate: 0).afterCalculated(fee: Money(10))


//: [Next](@next)
