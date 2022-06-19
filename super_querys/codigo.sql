/*Uso de IF */

SELECT COUNT(book_id) , 
SUM( IF(YEAR < 1950 , 1 , 0 ) ) 
from books; 


SELECT COUNT(book_id) , 
SUM( IF(YEAR < 1950 , 1 , 0 ) ) as 'Anterior' ,
SUM( IF(YEAR < 1950 , 0 , 1 ) ) as 'Posterior' 
from books; 
