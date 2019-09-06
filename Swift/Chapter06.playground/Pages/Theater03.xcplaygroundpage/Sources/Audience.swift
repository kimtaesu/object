import Foundation


public class Audience {
    let bag: Bag

    public init(bag: Bag) {
        self.bag = bag
    }
    
    func buy(_ ticket: Ticket) -> Int {
       return bag.hold(ticket);
    }
}
