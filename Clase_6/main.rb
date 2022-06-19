#declarar array 

a = [1,9,3,4,5,6,7,2]

# devuelve true o false, existe o no
puts a.include? 323 # false 

# si se utiliza ? devuelve true o false 
# si se utiliza ! devuelve un array alterado


# uso de map funciona similiar a each 

# suma 2 a cada elemento
# donde i es el elemento dentro del array
 a.map { |i| i + 2  }
puts "Antes del Map con !\n\n\n"
puts a

# modificar por completo el array => !
 a.map! { |i| i + 2  }
puts "Tres doritos despues >>>\n\n\n "
 puts a

 #numero par o impar con even 
 # se aplica a numeros 

 puts 4.even?

 # llamar al metodo even por cada elemento del array

puts a.map &(:even?)

# reduce 
# realizar una suma 
puts "\n\n\n Uso de reduce para sumar"
puts a.reduce(:+)

puts "\n\n\n Otra manera con 100"
puts "100 + el array = "  
puts a.reduce(100, :+)

# ya que el valor inicial por defecto es 0



# ordenar elementos con reduce 
puts "\n\n\n reduce para ordenar"

x = a.reduce do |primero , segundo|
	if primero > segundo
		primero
	else 
		segundo
	end 
end 

puts x


#select se maneja como una consulta

puts "\n\n\n uso de select :"
# escribe numeros menores a 7 dentro del array
puts a.select{|i| i< 7 }

#reject se maneja al contrario del select

puts "\n\n\n uso de reject :"
# escribe numeros mayores a 7 dentro del array
puts a.reject{|i| i< 7 }

# drop_while es similar al reject


# uso de Any => cualquiera


puts "\n\n\n uso de any :"
# algun numero mayor a 7
puts a.any?{|i| i< 7 } 

# metodo all pregunta si todos similar a any


# operador & el cual devuelve los elementos en comun de 2 arrays
puts "\n\n\n uso de & (cruze) :"
a = [1,2,3,4,5]
b = [2,3,4]

puts a & b


# multiplicar un array x2
puts "\n\n\n multiplicar un array x2 :"

puts a * 2

# multiplicar con una cadena 
puts "\n\n\n multiplicar un array por Ar :"

puts a * 'ar'