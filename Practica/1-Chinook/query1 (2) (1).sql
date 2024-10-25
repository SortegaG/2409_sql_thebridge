-- Query1

SELECT *
FROM customers
WHERE Country='Brazil';

-- Query2

SELECT *
FROM employees
WHERE Title='Sales Support Agent';

-- Query3

SELECT t.*
FROM tracks AS t
INNER JOIN albums as al ON t.AlbumId = al.Albumid
INNER JOIN artists as ar on al.ArtistId = ar.ArtistId
Where ar.Name = 'AC/DC';
-- NO TERMINADO
-- Query4

SELECT firstname || ' ' || lastname as NombreCompleto,
customerid AS ID,
country AS Pais
FROM customers
where country <> 'USA';

-- Query5

SELECT firstname || ' ' || lastname as NombreCompleto,
city || ' ' || state || ' ' || Country AS Direccion,
email AS Email
FROM employees
WHERE Title='Sales Support Agent';

-- Query6

select DISTINCT
billingcountry
from invoices;

SELECt billingcountry,
count (invoiceid)
FROM invoices
group by billingcountry
order by 2 desc

-- Query7

SELECT 
state,
count(customerid) as Nclientes
from customers
where country = 'USA'
group by state
order by 2 desc;

-- Query8

SELECT count (quantity)
from invoice_items
where invoiceid = '37';

-- Query9

SELECT COUNT (trackid)
from tracks
WHERE albumid in (1,4)

-- Query10 

SELECT InvoiceId, COUNT(*) AS TotalItems
FROM invoice_items
GROUP BY InvoiceId;

-- Query11

SELECT BillingCountry, COUNT(*) AS TotalInvoices
FROM invoices
GROUP BY 1
order by 2 desc

--Query12

SELECT strftime('%Y', InvoiceDate) AS Year, COUNT(*) AS TotalInvoices
FROM invoices
WHERE strftime('%Y', InvoiceDate) IN ('2009', '2011')
GROUP BY Year;

-- Query13

SELECT COUNT(*) AS TotalInvoices
FROM invoices
WHERE strftime('%Y', InvoiceDate) BETWEEN '2009' AND '2011';

-- Query14

SELECT Country, COUNT(*) AS TotalCustomers
FROM customers
WHERE Country IN ('Spain', 'Brazil')
GROUP BY Country;

-- Query15

SELECT Name
FROM tracks
WHERE Name LIKE 'You%';

-- SEGUNDA PARTE

--Query1

SELECT c.FirstName || ' ' || c.LastName AS Cliente, 
       i.InvoiceId, 
       i.InvoiceDate, 
       i.BillingCountry
FROM invoices i
JOIN customers c ON i.CustomerId = c.CustomerId
WHERE c.Country = 'Brazil';

-- Query2

SELECT e.FirstName || ' ' || e.LastName AS AgenteVentas, 
       i.InvoiceId, 
       i.InvoiceDate, 
       i.Total
FROM invoices i
JOIN customers c ON i.CustomerId = c.CustomerId
JOIN employees e ON c.SupportRepId = e.EmployeeId;

-- Query3 

SELECT c.FirstName || ' ' || c.LastName AS Cliente, 
       c.Country, 
       e.FirstName || ' ' || e.LastName AS AgenteVentas, 
       i.Total
FROM invoices i
JOIN customers c ON i.CustomerId = c.CustomerId
JOIN employees e ON c.SupportRepId = e.EmployeeId;

-- Query4 

SELECT i.InvoiceId, 
       t.Name AS Canción
FROM invoice_items as ii
JOIN tracks t ON ii.TrackId = t.TrackId
JOIN invoices i ON ii.InvoiceId = i.InvoiceId;

-- Query5 

SELECT t.Name AS Canción, 
       m.Name AS Formato, 
       a.Title AS Álbum, 
       g.Name AS Género
FROM tracks AS t
JOIN media_types AS m ON t.MediaTypeId = m.MediaTypeId
JOIN albums as a ON t.AlbumId = a.AlbumId
JOIN genres as g ON t.GenreId = g.GenreId;


-- Query6

SELECT p.Name AS Playlist, 
       COUNT(pt.TrackId) AS TotalCanciones
FROM playlists p
JOIN playlist_track pt ON p.PlaylistId = pt.PlaylistId
GROUP BY 1
ORDER by 2 DESC

-- Query7 

SELECT e.FirstName || ' ' || e.LastName AS Empleado, 
       SUM(i.Total) AS TotalVentas
FROM invoices i
JOIN customers AS c ON i.CustomerId = c.CustomerId
JOIN employees AS e ON c.SupportRepId = e.EmployeeId
GROUP BY Empleado;

-- Query8

SELECT e.FirstName || ' ' || e.LastName AS Empleado, 
       SUM(i.Total) AS TotalVentas
FROM invoices i
JOIN customers AS c ON i.CustomerId = c.CustomerId
JOIN employees AS e ON c.SupportRepId = e.EmployeeId
GROUP BY Empleado;

-- Query9 

select 
t1.ArtistId,
t1.Name AS NombreArtista,
SUM(t5.total) AS Vventas
from artists as t1
inner join albums t2 on t1.ArtistId = t2.ArtistId
inner join tracks t3 on t2.AlbumId = t3.AlbumId
INNER JOIN invoice_items t4 on t3.TrackId = t4.TrackId
inner join invoices t5 on t4.InvoiceId = t5.InvoiceId
GROUP by 1,2
ORDER by 3 DESC
limit 3