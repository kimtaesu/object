import Foundation

public struct Call {
    let from: Date
    let to: Date

    public init(from: Date, to: Date) {
        self.from = from
        self.to = to
    }
}

extension Call {
    var duration: TimeInterval {
        return to.timeIntervalSince(from)
    }
}

