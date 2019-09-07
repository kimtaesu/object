import Foundation


public class Theater {
    
    private let ticketSeller: TicketSeller
    
    public init(ticketSeller: TicketSeller) {
        self.ticketSeller = ticketSeller
    }
    
    public func enter(audience: Audience) {
        if audience.bag.hasInvitation() {
            let ticket = try! self.ticketSeller.ticketOffice.getTicket()
            audience.bag.setTicket(ticket)
        } else {
            let ticket = try! self.ticketSeller.ticketOffice.getTicket()
            audience.bag.minusAmount(ticket.fee)
            ticketSeller.ticketOffice.plusAmount(ticket.fee)
            audience.bag.setTicket(ticket)
        }
    }
}
