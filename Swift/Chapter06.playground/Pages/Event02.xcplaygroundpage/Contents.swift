import UIKit

var str = "Hello, playground"
Event(subject: "s", datOfWeek: Date(), from: Date(), duration: 1).isSatisfied(schedule: RecurringSchedule(subject: "sa", dayOfWeek: Date(), from: Date(), duration: 0))
Event(subject: "s", datOfWeek: Date(), from: Date(), duration: 1).reschedule(schedule: RecurringSchedule(subject: "sa", dayOfWeek: Date(), from: Date(), duration: 0))
