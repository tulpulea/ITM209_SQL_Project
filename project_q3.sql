select 
	customer.CustomerId,
    CONCAT(customer.FirstName," ", customer.LastName) as "Full Name",
	sum(invoiceline.Quantity*invoiceline.UnitPrice) as "Total Purchases",
    CONCAT_WS(Char(10),customer.Address,customer.City,customer.State,customer.Country,customer.PostalCode) as "Customer Address"
from
	musicsales.customer
inner join
	musicsales.invoice
on
	customer.CustomerId = invoice.CustomerId
inner join
	musicsales.invoiceline
on 
	invoice.InvoiceId = invoiceline.InvoiceId
group by
	customer.CustomerId
having
	sum(invoiceline.Quantity*invoiceline.UnitPrice) >= 35
order by
	sum(invoiceline.Quantity*invoiceline.UnitPrice) desc;