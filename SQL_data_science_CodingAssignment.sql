--- Q1) Using a subquery, find the names of all the tracks for the album "Californication".
What is the title of the 8th track?

Select name,
albumid
from  tracks 
where albumid in (Select albumid
    from albums
    where title = 'Californication');




--- Q2)Find the total number of invoices for each customer along with the customer's full name, city and email.
After running the query described above, what is the email address of the 5th person, František Wichterlová?

Select
c.FirstName,
c.LastName,
c.city,
c.Email,
count (i.customerid) as invoices
from (invoices i left join customers c on i.customerid = c.customerid)
group by c.customerid;




--- Q3) Retrieve the track name, album, artistID, and trackID for all the albums
What is the song title of trackID 12 from the "For Those About to Rock We Salute You" album? Enter the answer below.

Select t.name,
t.trackid,
a.title,
a.artistID
from (tracks t inner join albums a on t.albumid = a.albumid);




--- Q4) Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
After running the query described above, who are the reports for the manager named Mitchell (select all that apply)?

SELECT M.LastName AS Manager, E.LastName AS Employee
FROM Employees E INNER JOIN Employees M 
ON E.ReportsTo = M.EmployeeID




--- Q5)Find the name and ID of the artists who do not have albums.
After running the query described above, two of the records returned have the same last name. Enter that name below.

Select ar.name,
ar.ArtistID,
al.title
from Artists ar left join Albums al on ar.artistid = al.artistid
where al.title is null




--- Q6)Use a UNION to create a list of all the employee's and customer's first names 
and last names ordered by the last name in descending order.

Select firstname, lastname
From employees
union 
Select firstname, lastname
From Customers 
Order by lastname desc



--- Q7)See if there are any customers who have a different city listed in their billing city versus their customer city.

SELECT C.FirstName,
C.LastName,
C.City,
I.BillingCity
FROM Customers C
INNER JOIN Invoices I
ON C.CustomerId = I.CustomerId
WHERE  C.City!= BillingCity