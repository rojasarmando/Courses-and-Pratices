/*
	¿Cual es el primedio/desviacion standard del precio de libros?
*/
SELECT  
nationality as Pais ,
count(book_id) as Libros,
AVG(price) as Promedio , 
STDDEV(price) as 'Desviacion Estandar' 
from books as b
JOIN authors as a on a.author_id = b.author_id 

group by nationality
ORDER BY libros DESC;


/*Cual es el precio maximo de un libro*/

SELECT MAX(price) as 'maximo' , MIN(price) as 'minimo' from books where price IS NOT NULL; 