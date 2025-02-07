use Exercici5;
select *
from Cites, Client, Empleat, Vehicle
where Client.idClient=Vehicle.Client_idClient and Vehicle.idVehicle=Cites.Vehicle_idVehicle and Empleat.idEmpleat=Cites.Empleat_idEmpleat