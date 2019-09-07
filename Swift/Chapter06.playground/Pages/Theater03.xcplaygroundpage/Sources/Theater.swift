import Foundation


public class Theater {
    
    private let ticketSeller: TicketSeller
    
    public init(ticketSeller: TicketSeller) {
        self.ticketSeller = ticketSeller
    }
    
    public func enter(audience: Audience) {
        ticketSeller.sellTo(audience)
    }
}
