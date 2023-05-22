select
	sel.Surname,
	sel.Name,
	SUM(sal.Quantity) 
from Sales sal
	inner join Sellers sel on sel.ID = sal.IDSel
where sal.Date between '01.10.2013' and '07.10.2013'
group by sel.Surname, sel.Name
order by sel.Surname, sel.Name
