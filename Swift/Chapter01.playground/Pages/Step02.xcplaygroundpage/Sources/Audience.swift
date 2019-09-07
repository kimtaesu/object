import Foundation


public class Audience {
    let bag: Bag

    public init(bag: Bag) {
        self.bag = bag
    }
    
    func buy(_ ticket: Ticket) -> Int {
        if (bag.hasInvitation()) {
            bag.setTicket(ticket)
            return 0
        } else {
            bag.setTicket(ticket)
            bag.minusAmount(ticket.fee)
            return ticket.fee
        }
    }
}
