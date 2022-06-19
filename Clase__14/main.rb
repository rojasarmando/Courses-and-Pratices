# gem para el scrapping
require 'nokogiri'
# libreria por defecto para el scrapping
require 'open-uri'

# Sitio web a buscar
url = "http://www.falconmasters.com/"

# Uso de la gem donde se la pasa la url
pagina = Nokogiri::HTML(open(url))
 

# el proceso se repita 9 veces 
9.times do  |element|  
	#toma la seccion de articulos con class post
	#es un filtro de datos entre etiquetas
	articulos = pagina.css('article.post')
	#filtra los titulos
	titulo = articulos.css('h2.title')
	#captura el boton next
	siguiente = pagina.css('a.nextpostslink')

	# usa el array de todos los titulos de la seccion post
	titulo.each do |e|  
		# muestra el texto
		# filtra a y muestra lo que contiente su atribuo href
		puts e.text , e.css('a').attr('href')
		puts ""
		puts ""
		puts ""
	
	end
 	#filtra el a y toma su href para la siguiente pagina
 	#en la cual se hara el proceso 9 veces
	pagina = Nokogiri::HTML(open(siguiente.attr('href')))

end