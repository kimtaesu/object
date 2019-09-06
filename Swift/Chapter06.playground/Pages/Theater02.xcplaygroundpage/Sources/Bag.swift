import Foundation

public class Bag {
    private let invitation: Invitation?
    private var amount: Int
    private var ticket: Ticket? = nil
    
    public init(_ amount: Int) {
        self.amount = amount
        self.invitation = nil
    }
    public init(amount: Int, invitation: Invitation) {
        self.amount = amount
        self.invitation = invitation
    }
    
    func setTicket(_ ticket: Ticket) -> Int {
        if (hasInvitation()) {
            self.ticket = ticket
            return 0
        } else {
            self.ticket = ticket
            minusAmount(ticket.fee)
            return ticket.fee
        }
    }
    
    func hasInvitation() -> Bool {
        return invitation != nil
    }
    
    private func setTicket(_ ticket: Ticket) {
        self.ticket = ticket
    }
    
    func minusAmount(_ amount: Int) {
        self.amount -= amount
    }
    
    func plusAmount(_ amount: Int) {
        self.amount += amount
    }
}
