# excepciones

def porcentaje a , b  
	# verificar el error

	raise TypeError, 'El 1er Argumentos no es un numero' if !a.is_a? Numeric
	raise TypeError, 'El 2do Argumentos no es un numero' if !b.is_a? Numeric
	(a * 100.0) / b
end

puts porcentaje '2' , 100

