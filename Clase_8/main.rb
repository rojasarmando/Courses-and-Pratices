# Creacion de un archivo

file = File.open("armando.txt", "w")

file.puts 'Hola Mundo en txt'
file.puts 'Otra linea'
file.puts 'Fin'
file.close 

# leer el archivo

file = File.open("armando.txt", "r")

puts file.read

puts "····"
file.close 

# lectura completa del archivo 

file = File.open("armando.txt", "r")
puts "····"
file.readlines.each do |ln|

	puts ln

end

file.close 
