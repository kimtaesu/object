//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

Phone(amount: Money.ZERO, seconds: 0).calculateFee()
NightlyDiscountPhone(nightlyAmount: Money.ZERO, regularAmount: Money.ZERO, seconds: 0).calculateCallFee(call: Call(from: Date(), to: Date()))
//: [Next](@next)
