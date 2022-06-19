# excepciones

class Ventilador

	# lectura de variables 
	attr_reader :marca , :velocidad
	# solo escritura
	attr_writer :year 

	# Lectura y Escritura
	attr_accessor :color

	#constructor 
	def initialize arg
		@marca = arg[:marca]
		@velocidad = 0
		@year = 2010
		@color = 'rojo'
	end
	# metodo
	def marca=(marca)
	# propiedad  
		@marca = marca
	end

	def presentar_marca
		"La marca es = #{@marca}"
	end

	def decir
		"#{@year}"
	end
end

# instanciar 

ventilador = Ventilador.new(marca:'SSH')


puts ventilador.marca
puts ventilador.velocidad
puts ventilador.decir

ventilador.year = '2018'
puts ventilador.decir
puts ventilador.color

ventilador.color = 'azul'
puts ventilador.color
