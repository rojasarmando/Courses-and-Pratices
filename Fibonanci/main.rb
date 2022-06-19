# funcion

def fibo valor

	if valor == 0
		return 0
	elsif valor == 1
		return 1
	else
		return fibo(valor - 1) + fibo(valor -  2)
	end

end

puts fibo (ARGV[0].to_i + 1)