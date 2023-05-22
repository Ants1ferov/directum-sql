select 
	prod.Name as ProductName, 
	SUM(sal.Quantity) as QualtitySales
into #QuantitySales
from Sales sal
left join Products prod on prod.ID = sal.IDProd
where sal.Date between '01.10.2013' and '07.10.2013'
and prod.ID in (select distinct arr.IDProd from Arrivals arr
	where arr.Date between '07.09.2013' and '07.10.2013')
group by prod.Name
order by prod.Name

select
	prod.Name [Наименование продукции],
	sel.Surname [Фамилия],
	sel.Name [Имя],
	SUM(sal.Quantity) / (select qs.QualtitySales from #QuantitySales qs
		where qs.ProductName = prod.Name) * 100
from Sales sal
	inner join Products prod on prod.ID = sal.IDProd
	left join Sellers sel on sel.ID = sal.IDSel
where sal.Date between '01.10.2013' and '07.10.2013'
group by prod.Name, sel.Surname, sel.Name
order by prod.Name, sel.Surname, sel.Name