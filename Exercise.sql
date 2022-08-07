---Q1) How many albums does the artist Led Zeppelin have? 

Select 
COUNT(DISTINCT AlbumID) AS n_album,
AlbumID,
ArtistId
FROM albums
Where ArtistId in (Select ArtistId
    FROM artists
    Where name = 'Led Zeppelin')




--Q2) Create a list of album titles and the unit prices for the artist "Audioslave". How many records are returned?

Select 
i.unitPrice,
al.title,
count (al.name)
from (select Tracks.AlbumId,invoice_items.UnitPrice
        from tracks
        left join invoice_items on tracks.TrackId=invoice_items.TrackId) as i
            left join (select artists.Name,albums.Title,albums.AlbumId
            from artists
            left join albums on artists.ArtistId=albums.ArtistId) as al
on i.AlbumId=al.AlbumId
where al.Name="Audioslave";





--Q3)Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query?  

select c.FirstName,
c.LastName,
i.InvoiceId
From (customers c left join invoices i on c.CustomerId = i.CustomerId)
    where i.InvoiceId is null;
    
    
    
 --Q4) Find the total price for each album. What is the total price for the album “Big Ones”?
 Select a.title,
t.name,
t.unitprice,
sum(t.unitprice)
from (albums a inner join tracks t on a.albumid = t.albumid)
    where a.title = 'Big Ones'
 