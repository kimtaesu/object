import Foundation


public class Theater {
    
    private let ticketSeller: TicketSeller
    
    public init(ticketSeller: TicketSeller) {
        self.ticketSeller = ticketSeller
    }
    
    
    func enter(audience: Audience) {
        if audience.bag.hasInvitation() {
            let ticket = self.ticketSeller.ticketOffice.getTicket()
            audience.bag.setTicket(ticket: ticket)
        } else {
            let ticket = self.ticketSeller.ticketOffice.getTicket()
            audience.bag.minusAmount(amount: ticket.fee)
            ticketSeller.ticketOffice.plusAmount(amount: ticket.fee)
            audience.bag.setTicket(ticket: ticket)
        }
    }
}
