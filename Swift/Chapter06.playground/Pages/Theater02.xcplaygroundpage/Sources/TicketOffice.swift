import Foundation

enum TicketError: Error {
    case noTickets
}
public class TicketOffice {
    private var tickets: [Ticket] = []
    private var amount: Int
    
    public init(tickets: [Ticket], amount: Int) {
        self.tickets.append(contentsOf: tickets)
        self.amount = amount
    }
    
    func getTicket() throws -> Ticket {
        if tickets.isEmpty { throw TicketError.noTickets }
        
        return tickets.remove(at: 0)
    }
    
    func minusAmount(_ amount: Int) {
        self.amount -= amount
    }
    
    func plusAmount(_ amount: Int) {
        self.amount += amount
    }
}
