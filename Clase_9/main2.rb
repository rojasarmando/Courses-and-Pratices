# Rescue 

a = 1
b = '2'

begin
	
	c = a + b
rescue Exception => e
	puts 'No se puede Sumar'
else
	puts "El Resultado es #{c}"
end