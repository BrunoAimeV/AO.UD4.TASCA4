use Exercici7;
select count(LiniaTicket.idLiniaTicket) as "Numero de Tickets"
from LiniaTicket as LiniaTicket, Empleat as Empleat, Ticket as Ticket
where Ticket.Empleat_idEmpleat=Empleat.idEmpleat and Ticket.id=LiniaTicket.Ticket_id and Empleat.Nom like "P%";