//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

ServiceLocator.provide(discountPolicy: AmountDiscountPolicy(Money.ZERO, []))
let policies = DiscountPolicy(conditions: [])
let movie = Movie(title: "title", runningTime: 0, discountPolicy: policies, fee: Money.ZERO)
let screening = Screening(movie: movie, sequence: 0, startTime: Date(), dayOfWeek: Date(), endTime: Date())
try! screening.reserve(Customer(name: "a", id: "id"), 1)
//: [Next](@next)
