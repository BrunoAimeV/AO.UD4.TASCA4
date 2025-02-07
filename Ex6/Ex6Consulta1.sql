use Exercici6;
select Passatgers.Nom as Nom, Passatgers.Cognoms as Cognoms, Passatgers.DNI as DNI, Vol.NumVol as "Numero de vol", Vol.Origen as Origen, Vol.Desti as Destí, Reserva.ImportTotal as Import
from Passatgers as Passatgers, Vol as Vol, Reserva as Reserva
where Passatgers.idPassatgers=Reserva.Passatgers_idPassatgers and Vol.idVol=Reserva.Vol_idVol