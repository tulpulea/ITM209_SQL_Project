select
	CONCAT(customer.FirstName," ", customer.LastName) as "Full Name",
    CONCAT_WS(Char(10),invoice.BillingAddress,invoice.BillingCity,invoice.BillingState,invoice.BillingCountry,invoice.BillingPostalCode) as "Full Invoice Address",
	CONCAT_WS(Char(10),customer.Address,customer.City,customer.State,customer.Country,customer.PostalCode) as "Address In FIle"
from
	musicsales.customer
inner join
	musicsales.invoice
on
	customer.CustomerId = invoice.CustomerId
where
	customer.PostalCode <> invoice.BillingPostalCode;