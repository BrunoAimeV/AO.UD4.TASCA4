use Exercici6;
select Reserva.Numero as "Numero de reserva", Passatgers.Nom as Nom, Passatgers.Cognoms as Cognoms, Vol.NumVol as "Numero de vol"
from Reserva as Reserva, Passatgers as Passatgers, Vol as Vol
where Reserva.Passatgers_idPassatgers=Passatgers.idPassatgers and Reserva.Vol_idVol=Vol.idVol