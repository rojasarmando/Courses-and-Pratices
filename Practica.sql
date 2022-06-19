/*
	Base de datos de practica
 */

create database practica;

use practica;

create table modulos (

	id_modulos int unsigned auto_increment,
	descripcion varchar(100) not null unique,
	fecha_c datetime default now(),
	fecha_m datetime default now(),
	status TINYINT(1) default 1,

	primary key (id_modulos)

);



create table sub_modulos (

	id_sub_modulos int unsigned auto_increment,
	id_modulos int unsigned,
	descripcion varchar(100) not null ,
	fecha_c datetime default now(),
	fecha_m datetime default now(),
	status TINYINT(1) default 1,
	primary key (id_sub_modulos),
	constraint pk49 foreign key ( id_modulos ) references  modulos (id_modulos)
);





create table roles (

	id_roles int unsigned auto_increment,
	descripcion varchar(100) not null unique,
	fecha_c datetime default now(),
	fecha_m datetime default now(),
	status TINYINT(1) default 1,

	primary key (id_roles)

);

create table permisos(

	id_roles int unsigned,
	id_sub_modulos int unsigned,

	constraint pk50 foreign key  ( id_roles ) references  roles (id_roles),
	constraint pk51 foreign key ( id_sub_modulos ) references  sub_modulos (id_sub_modulos)

);



create table usuarios (

	id_usuarios int unsigned ,
	id_roles int unsigned,
	nick varchar(12) not null unique,
	nombre varchar(40) not null,
	clave varchar(100),
	pregunta varchar(50),
	respuesta varchar(100),

	fecha_c datetime default now(),
	fecha_m datetime default now(),
	status TINYINT(1) default 1,

	primary key (id_usuarios),
	constraint pk44 foreign key ( id_roles ) references  roles (id_roles)

);



create table eventos (

	id_eventos int unsigned auto_increment,
	descripcion varchar(70) not null unique,
	status TINYINT(1) default 1,

	primary key  (id_eventos)

);

create table logs (

	fecha datetime default now(),
	id_eventos int unsigned,
	id_usuarios int unsigned,
	descripcion varchar(100),
	constraint pk3 foreign key ( id_eventos ) references  eventos (id_eventos),
	constraint pk4 foreign key ( id_usuarios ) references  usuarios (id_usuarios)
);







/*Volcando datos para eventos*/


create table configuracion (

	id_configuracion int unsigned auto_increment,
	descripcion varchar(100) not null,
	fecha datetime,

	primary key  (id_configuracion)

);

insert configuracion (descripcion, fecha) values ( '137627911d58602826fd657b3caccb1e' , 20180311003744 );

insert configuracion (descripcion, fecha) values ( '137627911d58602826fd657b3caccb1e' , 20180311003744 );




create table categorias (

	id_categorias int unsigned auto_increment,
	descripcion varchar(45) not null unique,
	fecha_c datetime default now(),
	fecha_m datetime default now(),
	status TINYINT(1) default 1,

	primary key (id_categorias)
);



create table sub_categorias (

	id_sub_categorias int unsigned auto_increment,
	id_categorias int unsigned,
	descripcion varchar(45) not null unique,
	fecha_c datetime default now(),
	fecha_m datetime default now(),
	status TINYINT(1) default 1,

	primary key pk2 (id_sub_categorias),

	constraint pk foreign key ( id_categorias ) references  categorias (id_categorias)
);




create table presentacion (

	id_presentacion int unsigned auto_increment,
	descripcion varchar(45) not null unique,
	fecha_c datetime default now(),
	fecha_m datetime default now(),
	status TINYINT(1) default 1,

	primary key  (id_presentacion)

);


create table empresas (

	id_empresas int unsigned auto_increment,
	descripcion varchar(45) not null unique,
	fecha_c datetime default now(),
	fecha_m datetime default now(),
	status TINYINT(1) default 1,

	primary key  (id_empresas)
);



create table distribuidora (

	id_distribuidora int unsigned auto_increment,
	id_empresas int unsigned,
	descripcion varchar(45) not null unique,
	nombre varchar(100),
	telefono varchar(12)  not null unique,
	fecha_c datetime default now(),
	fecha_m datetime default now(),
	status TINYINT(1) default 1,

	primary key  (id_distribuidora),
	constraint pk323 foreign key ( id_empresas ) references  empresas (id_empresas)

);



create table productos(

	id_productos int unsigned auto_increment,

	id_sub_categorias int unsigned,
	id_distribuidora int unsigned,
	id_presentacion int unsigned,

	descripcion varchar(60) not null unique,
	stock_max int,
	stock_min int,
	cantidad int,

	fecha_c datetime default now(),
	fecha_m datetime default now(),
	status TINYINT(1) default 1,

	primary key  (id_productos),


	constraint pk5 foreign key ( id_sub_categorias ) references  sub_categorias (id_sub_categorias),
	constraint pk6 foreign key ( id_distribuidora ) references  distribuidora (id_distribuidora),
	constraint pk7 foreign key ( id_presentacion ) references  presentacion (id_presentacion)

);





/*

	Tablas transacciopnales
 */

create table despacho(

	id_despacho int unsigned auto_increment,
	id_productos int unsigned,
	cantidad int,
	fecha_c datetime,
	fecha_m datetime,
	status TINYINT(1),

	primary key  (id_despacho),
	constraint pk11 foreign key ( id_productos ) references  productos (id_productos)

);

create table abastecimiento(

	id_abastecimiento int unsigned auto_increment,
	id_productos int unsigned,
	cantidad int,
	fecha_c datetime,
	fecha_m datetime,
	status TINYINT(1),

	primary key  (id_abastecimiento),
	constraint pk12 foreign key ( id_productos ) references  productos (id_productos)

);

/*
##############################

 Volcado de Datos
#############################
 */



/*

 ##############
	Modulos y sub modulos
###############

*/
insert into modulos (descripcion) values ('usuarios');
insert into modulos (descripcion) values ('distribuidora');
insert into modulos (descripcion) values ('logs');
insert into modulos (descripcion) values ('empresas');


/*modulo usuarios*/
insert into sub_modulos ( id_modulos , descripcion) values (1 , 'consultar');
insert into sub_modulos ( id_modulos , descripcion) values (1 , 'imprimir');
insert into sub_modulos ( id_modulos , descripcion) values (1 , 'registrar');
insert into sub_modulos ( id_modulos , descripcion) values (1 , 'modificar');
insert into sub_modulos ( id_modulos , descripcion) values (1 , 'desactivar');

/*modulo distribuidora*/
insert into sub_modulos ( id_modulos , descripcion) values (2 , 'consultar');
insert into sub_modulos ( id_modulos , descripcion) values (2 , 'imprimir');
insert into sub_modulos ( id_modulos , descripcion) values (2 , 'registrar');
insert into sub_modulos ( id_modulos , descripcion) values (2 , 'modificar');
insert into sub_modulos ( id_modulos , descripcion) values (2 , 'desactivar');

/*logs */
insert into sub_modulos ( id_modulos , descripcion) values (3 , 'consultar');

/*modulo distribuidora*/
insert into sub_modulos ( id_modulos , descripcion) values (4 , 'consultar');
insert into sub_modulos ( id_modulos , descripcion) values (4 , 'imprimir');
insert into sub_modulos ( id_modulos , descripcion) values (4 , 'registrar');
insert into sub_modulos ( id_modulos , descripcion) values (4 , 'modificar');
insert into sub_modulos ( id_modulos , descripcion) values (4 , 'desactivar');




/* Eventos*/


insert into eventos (descripcion)  values ('Ingresó al Sistema');
insert into eventos (descripcion)  values ('Salio exitosamente del Sistema');
insert into eventos (descripcion)  values ('Intento ingresar a una pagina');
insert into eventos (descripcion)  values ('Ingreso a ');
insert into eventos (descripcion)  values ('Genero un nuevo  ');
insert into eventos (descripcion)  values ('Genero una nueva  ');
insert into eventos (descripcion)  values ('Modificando un ');
insert into eventos (descripcion)  values ('Modificando una ');
insert into eventos (descripcion)  values ('Cambio de Estado a un ');
insert into eventos (descripcion)  values ('Cambio de Estado a una ');
insert into eventos (descripcion)  values ('Abastecio ');
insert into eventos (descripcion)  values ('Despacho ');
insert into eventos (descripcion)  values ('Realizo un filtrado de tablas en modulo ');
insert into eventos (descripcion)  values ('Genero un Reporte en ');
insert into eventos (descripcion)  values ('Realizo una peticion AJAX en ');
insert into eventos (descripcion)  values ('Elimino un ');
insert into eventos (descripcion)  values ('Elimino a un ');
insert into eventos (descripcion)  values ('Ocurrion un error en ');
insert into eventos (descripcion)  values ('Intento ');


/*Tipos de usuario*/
insert into roles (descripcion) values ("Root");
insert into roles (descripcion) values ("Administrador");


/*
	Rol => administrador , id => 2
	Permiso => 1..5 Usuarios = acceso denegado
 */
insert permisos values(2,1);
insert permisos values(2,2);
insert permisos values(2,3);
insert permisos values(2,4);
insert permisos values(2,5);
insert permisos values(2,6);




/*Usuarios*/

insert into usuarios (id_usuarios, nick , nombre,clave,pregunta,respuesta, id_roles) values (2605957, 'ARMANDO2018',"ARMANDO ROJAS", md5('Ar12345678') , 'Eres Chavizta' ,	md5('TU ERES MARICO'), 1 );
insert into usuarios (id_usuarios, nick , nombre,clave,pregunta,respuesta, id_roles) values (12964334, 'NORKIS2018',"NORKIS QUERALES", md5('Ar12345678') , 'Eres Chavizta' ,	md5('TU ERES MARICO'), 1 );








/*Categoria*/

insert into categorias (descripcion) values ("Bebidas Alcoholicas");
insert into categorias (descripcion) values ("Otro tipo de Bebidas" );

/*Sub categorias*/

	/*Categoria 1 -- Bebidas alcoholica... */

insert into sub_categorias (id_categorias,descripcion)	values (1,'Cerveza');
insert into sub_categorias (id_categorias,descripcion)	values (1,'Cucuy de Penca');

	/*otro tipo de Bebidas */

insert into sub_categorias (id_categorias,descripcion)	values (2,'Malta');
insert into sub_categorias (id_categorias,descripcion)	values (2,'Jugo');

/*Presentacion*/

insert into presentacion (descripcion) values ('Caja de 32 unidades');
insert into presentacion (descripcion) values ('Caja de 28 unidades');
insert into presentacion (descripcion) values ('Litros ');
insert into presentacion (descripcion) values ('Mililitros ');


/*Empresas*/

insert into empresas (descripcion) values ("La Polar");
insert into empresas (descripcion) values ("La Regional");
insert into empresas (descripcion) values ("UnicornioLandia en Revolucion");


/*Distribuidora  */

insert distribuidora (id_empresas , descripcion , nombre , telefono ) values (1, 'Doña Oliva Serrada','Nelsibeth Oliva','04145235969');
insert distribuidora (id_empresas , descripcion , nombre , telefono ) values (2, 'Mafia Cabrera','Cerenis Cabrera','04245452248');




