use Exercici7;
select Producte.idProducte as Producte, Producte.Descripcio as Descripció, Producte.Preu as "Preu Unitari", Producte.IVA as IVA, Producte.CodiBarres as "Codi de Barres"
from Producte as Producte 
where Producte.IVA="21" and Producte.CodiBarres like "8401%";