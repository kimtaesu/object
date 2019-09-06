import Foundation

public class TicketSeller {
    let ticketOffice: TicketOffice
    
    public init(_ ticketOffice: TicketOffice) {
        self.ticketOffice = ticketOffice
    }
    
    public func sellTo(_ audience: Audience) {
        ticketOffice.plusAmount(audience.buy(ticketOffice.getTicket()))
    }
}
