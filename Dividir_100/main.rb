def dividir num , num2

	puts num / num2

rescue

	puts "Error :c "
end

dividir ARGV[0].to_i , ARGV[1].to_i