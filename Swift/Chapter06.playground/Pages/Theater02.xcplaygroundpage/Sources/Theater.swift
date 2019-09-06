import Foundation


public class Theater {
    
    private let ticketSeller: TicketSeller
    
    public init(ticketSeller: TicketSeller) {
        self.ticketSeller = ticketSeller
    }
    
    func enter(audience: Audience) {
        ticketSeller.setTicket(audience)
    }
}
