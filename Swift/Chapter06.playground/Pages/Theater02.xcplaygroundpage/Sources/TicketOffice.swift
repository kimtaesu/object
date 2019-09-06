import Foundation


public class TicketOffice {
    private var tickets: [Ticket] = []
    private var amount: Int
    
    public init(tickets: [Ticket], amount: Int) {
        self.tickets.append(contentsOf: tickets)
        self.amount = amount
    }
    
    func getTicket() -> Ticket {
        return tickets.remove(at: 0)
    }
    
    func minusAmount(_ amount: Int) {
        self.amount -= amount
    }
    
    func plusAmount(_ amount: Int) {
        self.amount += amount
    }
}
