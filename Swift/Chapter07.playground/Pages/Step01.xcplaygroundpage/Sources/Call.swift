import Foundation

public struct Call {
    let from: Date
    let to: Date
}

extension Call {
    var duration: TimeInterval {
        return to.timeIntervalSince(from)
    }
}

