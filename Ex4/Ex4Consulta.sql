use `Exercici 4`;
SELECT Clients.DNI as "DNI", Clients.Nom as "Nom", Clients.Cognoms as "Cognoms", Polissa.NumPolissa as "Número de la Pólissa", TipusPolissa.Nom as "Tipus Polissa"
From Clients, Polissa, TipusPolissa
Where Clients.idClients=Polissa.Clients_idClients and TipusPolissa.idTipusPolissa=Descripcio and TipusPolissa.Nom like "%Viatges%"