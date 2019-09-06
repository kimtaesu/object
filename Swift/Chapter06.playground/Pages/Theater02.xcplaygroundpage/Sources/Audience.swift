import Foundation


public class Audience {
    let bag: Bag
    
    public init(bag: Bag) {
        self.bag = bag
    }
    
    func setTicket(ticket: Ticket) -> Int {
        return bag.setTicket(ticket)
    }
}
