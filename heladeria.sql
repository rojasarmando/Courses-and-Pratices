create database heladeria; 

use heladeria;

 create table helados(
  id int unsigned auto_increment,
  descripcion varchar(40) not null unique,
  unique i_iddescripcion(id, descripcion)

 );

insert into helados (descripcion) values ('Chocolate'); 
insert into helados (descripcion) values ('Vainilla'); 
insert into helados (descripcion) values ('Fresa'); 
insert into helados (descripcion) values ('Tornado de Oreo'); 
insert into helados (descripcion) values ('Uva'); 
insert into helados (descripcion) values ('Ron con Pasas'); 

create table persona(

	cedula int,
	nombre varchar(40),
	apellido varchar(40),
	sexo char,
	musica char,
	religion char,
	politica char,
	arte char,
	id int,
	constraint 
	primary key ss (cedula)
	
);