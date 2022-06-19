/*asi da error */
insert into usuarios (id_usuarios, nick , nombre,clave,pregunta,respuesta, id_roles)
	values (2605957, 'ARMANDO2018',"ARMANDO ROJAS", md5('Ar12345678') ,
			'secreto' ,	md5('TU ERES MARICO'), 1 );

/*asi ignoramos el error y modificamos los datos*/

insert into usuarios (id_usuarios, nick , nombre,clave,pregunta,respuesta, id_roles)
	values (2605957, 'ARMANDO2018',"ARMANDO JOSE ROJAS", md5('Ar12345678') ,
			'secreto' ,	md5('control1234**'), 1 )
	ON DUPLICATE KEY UPDATE nombre = values(nombre);
