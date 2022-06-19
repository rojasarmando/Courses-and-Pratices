# excepciones

class Ventilador

	#constructor 
	def initialize(marca)
		@marca = marca
	end
	# metodo
	def marca=(marca)
	# propiedad  
		@marca = marca
	end

	def presentar_marca
		"La marca es = #{@marca}"
	end
end

# instanciar 

ventilador = Ventilador.new('SSH')


puts ventilador.presentar_marca
