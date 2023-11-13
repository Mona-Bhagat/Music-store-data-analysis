

--Q1 - Who is the most senior employee ?

select * from employee
order by levels desc

-- Which countries have the most invoices?

select COUNT(*) as countrycount, billing_country from invoice
group by billing_country
order by countrycount desc

-- What are the top 3 values of Total invoice?

select top(3) total from invoice
order by total desc

--which city has provided highest revenue? City name and totals 
select SUM(total) as invoicetotal, billing_city from invoice
group by billing_city
order by invoicetotal desc

--customer-id with highest spend

select c.customer_id ,SUM(total) as highcustspend
from customer c
full join invoice on invoice.customer_id = c.customer_id
group by c.customer_id
order by highcustspend desc
select * from customer


--query to return the e-mail, firs and last name, genre of all Rock music listeners


select distinct email, first_name, last_name

from customer
join invoice on customer.customer_id = invoice.invoice_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id

where track_id IN(

select track_id from track
join genre on track.genre_id = genre.genre_id
where genre.name = 'Rock')


--artists name who have written highest number of rock music. Also total track count of top 10 rock bands
select  artist.name, artist.artist_id, COUNT(artist.artist_id) as totalrocksongs 
from track

join album2 on album2.album_id = track.album_id
join artist on artist.artist_id = album2.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name = 'Rock'

group by artist.artist_id
order by totalrocksongs desc


--track names higher than averge length. name and milliseconds, order by song length

select name, milliseconds
from track
where milliseconds >  
(select AVG(milliseconds) as avg_track_length 
from track)
order by milliseconds desc






