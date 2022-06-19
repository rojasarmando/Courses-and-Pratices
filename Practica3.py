# Regresion Lineal -- 
# by: Armando Rojas

# calcular la proxima venta tomando en cuanta los siguientes datos:
# 
# Mes		Ganancia
# 1	enero	7000
# 2	febrero	9000
# 3	marzo	5000
# 4	abril	110000
# 5 mayo	10000
# 6 junio	13000
# 
# Ejercicio:
# 
# 	paso 1: la sumatoria de ventas multiplicado por los meses
# 	
from math import *

def paso1(datos): #calcular la pendiente 

	resultado = 0 #la sumatoria de el costo por el tiempo
	resultado2 = 0 # la sumatoria de los costos 
	resultado3 = 0 # la sumatoria del tiempo
	resultado4 = 0 # eleva al cuadrado el tiempo, y se suman


	for x in datos:
		resultado = resultado  + ( x[0] * x[1] )
		resultado2 = resultado2  + x[1] 
		resultado3 = resultado3 + x[0]
		resultado4 = resultado4 + ( pow (x[0],2) )

	resultado5 = pow(resultado3 , 2) # eleva al cuadrado la suma del tiempo
	ultimo = datos[-1][0] #utlimo tiempo

	print resultado , "\n"
	print resultado2 , "\n"
	print resultado3 , "\n"
	print resultado4 , "\n"
	print resultado5 , "\n"
	print ultimo , "\n"



	return ( (ultimo * resultado) -  ( resultado2 * resultado3 )  ) / ( ( ultimo * resultado4 ) - resultado5 ) 


datos = [
		
		[1,7000],[2,9000],[3,5000],
		[4,11000],[5,10000],[6,13000]

	]

print paso1(datos)