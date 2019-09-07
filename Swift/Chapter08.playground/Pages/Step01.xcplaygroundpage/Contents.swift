//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

let policies = DiscountPolicy(conditions: [])
let movie = Movie(title: "title", runningTime: 0, discountPolicy: policies, fee: Money.ZERO)
OverlappedDiscountPolicy(discountPolicies: []).getDiscountAmount(screening: Screening(movie: movie, sequence: 0, startTime: Date(), dayOfWeek: Date(), endTime: Date()))
//: [Next](@next)
