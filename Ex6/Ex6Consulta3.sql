use Exercici6;
select count(Avio.idAvio), Avio.Marca as Marca, Avio.Model as Model, Avio.Capacitat as Capacitat, 
Vol.NumVol as NumVol, Vol.Origen as Origen, Vol.Desti as Desti
from Avio as Avio, Vol as Vol
where Avio.idAvio = Vol.Avio_idAvio and Avio.Marca like "320%"