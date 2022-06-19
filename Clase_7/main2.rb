#Proc y Lambdas

saludar = lambda { |nombre| puts "Hola #{nombre}" }

saludar.call('Armando Rojas')

saludar2 = proc { |nombre| puts "Hola #{nombre}" }

saludar2.call('Cerenis')