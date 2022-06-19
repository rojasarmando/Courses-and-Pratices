# Ejercicio de la clase

def crear_series n
	#declara un array
	array = [1,2]

	#se ejecuta el codido n - 2 veces 
	(n - 2).times {
		# agrega ultimo y penultimo elementos al array
		array << array[-1] + array[-2]
	}

	#devuelve el array
	array
end

def arreglo_impar array

	new_array = []

	array.each do |i| 

		if(!i.even?)
			new_array << i
		end

	end 

	new_array
end

arreglos = crear_series ARGV[0].to_i
puts arreglo_impar arreglos

