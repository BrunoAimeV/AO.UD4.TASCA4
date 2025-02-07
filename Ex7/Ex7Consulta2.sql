use Exercici7;
select Ticket.NumFactura as Factura, Ticket.Dia as Data, Ticket.Hora as Hora, Empleat.Nom as Empleat, SUM(LiniaTicket.ImportTotal*Producte.IVA!!!) as Preu
from Ticket as Ticket, Empleat as Empleat, LiniaTicket as LiniaTicket, Producte as Producte
where Empleat.idEmpleat = Ticket.Empleat_idEmpleat and Ticket.id=LiniaTicket.Ticket_id and Producte.idProducte=LiniaTicket.Producte_idProducte
group by Ticket.NumFactura, Ticket.Dia, Ticket.Hora, Empleat.Nom;