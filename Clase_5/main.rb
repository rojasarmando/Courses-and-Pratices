# Funciones 

def cerenis()

	puts "Hola Cerenis"

end 

# invocar a la funcion si parametros 
cerenis


# funcion con parametro
def armando( valor = "Armando Rojas" )

	puts "hola #{valor}"
	
end

armando

armando("Leonardo Jose")

# retornado valor 

def x2(valor = 0)

	return valor * valor

end

# 16
puts x2(4)


def saludar nombre

	puts "¡Hola! #{nombre}"
	
end


def saludarNP nombre , apellido

	puts "¡Hola! #{nombre} #{apellido}"
	
end

saludar "Cerenis Cabrera"

saludarNP "Armando" , "Rojas"

# usango argumentos 

def mensajes *argumentos

	for sms in argumentos
		puts sms  
	end

end 

mensajes "Hola Armando" , "Alerta de Seguridad"

# funciones con hash( similar a un diccionario de python)





def saludamos argumentos

	puts "tu nombre #{argumentos[:nombre]}"
	puts "tu edad #{argumentos[:edad]}"
end


saludamos h = {'nombre':'Armando Rojas', 'edad':20}


# retornar sin usar return 

def restar a , b 

	a - b 
end 

puts restar 5 , 4