import Foundation

public class TicketSeller {
    let ticketOffice: TicketOffice
    
    public init(_ ticketOffice: TicketOffice) {
        self.ticketOffice = ticketOffice
    }
    
    public func setTicket(_ audience: Audience) {
        ticketOffice.plusAmount(audience.setTicket(ticket: ticketOffice.getTicket()))
    }
}
