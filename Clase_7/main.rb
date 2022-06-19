# pasar el bloque como argumento

def ejecuta(&block)
	#llamar al block
	block.call
end

ejecuta { puts "Hola Baby" }

# validar bloque

def ejecuta2(&block)

	if block_given?
	#llamar al block
		block.call
	else
		puts "NO HAY BLOQUE"
	end

end

ejecuta2 

# simplificando todo con un yield

def ejecuta3

	if block_given?
	#llamar al block
		yield
	else
		puts "NO HAY BLOQUE"
	end

end

ejecuta3 { puts "hola que tal?" }
ejecuta3 