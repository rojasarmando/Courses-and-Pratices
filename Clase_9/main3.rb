# ensure

def fullname firts , second

	firts + second
rescue => error
	"El error es: #{error.message}"
ensure
	return second
end

puts fullname 23 , "armando"