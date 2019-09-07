//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

Event(subject: "s", datOfWeek: Date(), from: Date(), duration: 1).isSatisfied(schedule: RecurringSchedule(subject: "sa", dayOfWeek: Date(), from: Date(), duration: 0))
//: [Next](@next)
