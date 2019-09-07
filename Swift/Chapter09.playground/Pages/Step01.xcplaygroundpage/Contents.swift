//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

let policies = DiscountPolicy(conditions: [])
let movie = Movie(title: "title", runningTime: 0, discountPolicy: policies, fee: Money.ZERO)
let screening = Screening(movie: movie, sequence: 0, startTime: Date(), dayOfWeek: Date(), endTime: Date())
AmountDiscountPolicy(Money.wons(amount: 100), []).getDiscountAmount(screening)
NoneDiscountPolicy(conditions: []).getDiscountAmount(screening)
PercentDiscountPolicy(percent: 0, conditions: []).getDiscountAmount(screening)
//: [Next](@next)
