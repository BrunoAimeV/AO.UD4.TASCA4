use Exercici5;
select Cites.idCites as num, Cites.data as dia, Cites.Hora as Hora, Vehicle.Marca as Marca, Vehicle.Model as Model, Client.Nom as Client
from Cites as Cites, Vehicle as Vehicle, Client as Client
where Vehicle.idVehicle=Cites.Vehicle_idVehicle and Client.idClient=Vehicle.Client_idClient and Cites.data>"21/2/2025";