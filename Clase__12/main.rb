# herencia 

class Mamifero

	def initialize nombre
		@nombre = nombre
	end

	def respirar
		"Esta Respirando"
	end

	def comer alimento
		"Esta comiendo #{alimento}"
		
	end


end

class Perro < Mamifero

	def initialize

		super("Pablo")
	end

	def comer
		super "Arroz"

	end

	def ladrar

		"esta ladrando (que ladilla con el perro #{@nombre})"
	
	end

end

perro = Perro.new

puts perro.respirar
puts perro.ladrar
puts perro.comer