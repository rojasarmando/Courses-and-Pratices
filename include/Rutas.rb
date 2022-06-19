#libreria para procesar plantillas 
require 'erb'
#libreria para usar la Api
require 'httparty'

class Rutas
	@titulo = ""
	def self.call(env)
		if env['PATH_INFO'] == '/'
			# Url de la API
			url = 'https://jsonplaceholder.typicode.com/posts/'

			#Cargar Vista
			body = ERB.new(File.read('vista/index.html.erb'))
			@titulo = "Armandito"
			#obtener los datos de la API y transformarlos a JSON 
			@post = JSON.parse(HTTParty.get(url).body)

			@contador = 0

			[200 , {} , [body.result(binding)]  ] 
		elsif env['PATH_INFO'] == '/css/armando.css'
			body = ERB.new(File.read('css/armando.css'))

			[200 , {} , [body.result]  ] 

		else 
			[400 , {} , ['No Existe esta pagina :c']  ] 
		end 
	end
end



