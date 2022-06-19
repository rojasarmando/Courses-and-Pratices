/*Edadd y Nombre */

select name , year(now()) - year(birthdate) as Edad from clients where name like '%sa%' limit 10;

/*cantidad de libros*/

select count(*) from books;

/*condicion*/
select * from authors where author_id > 0 and author_id < 6;

select * from authors where author_id between 1 and 5; 

/*
JOIN - union  
	donde book es la tbla pivote
*/

/
select b.book_id , a.name, b.title  from 
books as b inner JOIN authors as a on a.author_id = b.author_id
where a.author_id between 1 and 5; 


select b.book_id , a.name, b.title  from 
authors as a inner JOIN books as b  on a.author_id = b.author_id
where a.author_id between 1 and 5; 

select c.name as Nombre , b.title as Titulo , a.name as Autor , t.type as Estado 
from transactions as t 
inner JOIN books as b on t.book_id = b.book_id
inner JOIN clients as c on c.client_id = t.client_id 
inner JOIN authors as a on a.author_id = b.author_id
where c.gender='F' and t.type in ('sell','lend');


select e.nombre as nombre , c.nota as nota , g.descripcion as grado
, e.sexo as sexo, l.nota as literal, l.descripcion as texto,
e.fecha_n as edad, ll.descripcion as lugar, cc.seccion as  seccion,
m.nombre as maestro, CONCAT( p.inicio , "-" , p.cierre ) as periodo,
l.valor as interpretacion
from estudiantes as e 
INNER JOIN cursos_estudiantes as c ON c.estudiante_id = e.estudiante_id
INNER JOIN cursos as cc ON cc.curso_id = c.curso_id
INNER JOIN grados as g ON g.grado_id = cc.grado_id
inner JOIN literales as l ON  e.sexo = l.sexo and c.nota between l.rango_d and l.rango_h
inner JOIN lugares as ll ON ll.lugar_id = e.lugar_id
inner JOIN maestros as m on cc.maestro_id = m.maestro_id
inner JOIN periodos as p on p.periodo_id = cc.periodo_id
\G


/* Uso de Left Join */

select a.author_id as ID_AUTOR, a.name as Nombre, a.nationality as Pais, b.title
from authors as a 
left join books as b on b.author_id = a.author_id
where a.author_id between 1 and 5
order by a.name desc

/*Uso de Count*/

SELECT  a.author_id as ID_AUTOR, a.name as Nombre, a.nationality as Pais,COUNT( b.title ) as 'cantidad de libro'
from authors as a 
left join books as b on b.author_id = a.author_id
where a.author_id between 1 and 5
GROUP BY a.author_id
order by a.name desc;

/*uso de DISTINCT */


/*Cuantos escritores hay de cada nacionalidad???*/
SELECT DISTINCT nationality , COUNT(author_id) FROM authors GROUP BY nationality; 

/*uso de IS NOT */

SELECT DISTINCT nationality , COUNT(author_id) FROM authors
where nationality IS NOT NULL AND nationality NOT in ('RUS','AUS')
 GROUP BY nationality;

 /*Uso de CONCAT */

 SELECT c.name, t.type, b.title,
	 CONCAT(a.name , "(" , a.nationality ,")") as autor
FROM transactions as t
LEFT JOIN clients as C 
	ON c.client_id = t.client_id
LEFT JOIN books as b
	on b.book_id = t.book_id
LEFT JOIN authors as a
	ON b.author_id = a.author_id;


/* USO DE TO_DAYS*/


 SELECT c.name, t.type, b.title,
	 CONCAT(a.name , "(" , a.nationality ,")") as autor,
	 ( TO_DAYS( NOW() ) - TO_DAYS( '2018-01-23' )  ) as Ago
FROM transactions as t
LEFT JOIN clients as C 
	ON c.client_id = t.client_id
LEFT JOIN books as b
	on b.book_id = t.book_id
LEFT JOIN authors as a
	ON b.author_id = a.author_id;


/*Entendiendo COUNT() y SUM() */

SELECT COUNT(book_id) , SUM(1) from books; 


/* Repaso */
SELECT COUNT(book_id) , SUM(1) from books; 

SELECT SUM(price * copies ) from books where sellable = 1; 

SELECT SUM(price * copies) , nationality 
from books as b
JOIN authors as a on a.author_id = b.book_id
WHERE price IS NOT NULL
group by nationality;

/*cumpleaños*/

 select  TRUNCATE ((TO_DAYS(now()) -  TO_DAYS('1997-09-16') )  / 365 , 0 ) as Edad;
