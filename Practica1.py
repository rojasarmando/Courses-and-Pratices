from math import *
#Obtener promedio
def media(datos):
    sumatoria = sum(datos)
    n = len(datos)
    result = sumatoria / n
    return result

#Obtener moda
def moda(datos):
    #Valores a tomar en cuentadatos.sort
    resultados = []
    repeticiones = 0
    #Contar los valores y obtener los mas repetidos
    for i in datos:
        apariciones = datos.count(i)
        if apariciones >= repeticiones:
            if apariciones == repeticiones and resultados.count(i) == 0:
                resultados.append(i)
            elif resultados.count(i) == 0:
                resultados = [i]
            repeticiones = datos.count(i)
    return resultados


#Obtener mediana
def mediana(datos):
    mediana = 0
    n = len(datos)
    datos.sort()
    if n % 2 == 0: # si es par la formula es: Me = X(n / 2 ) + X((n / 2) + 1)
        mediana = (datos[int((n / 2) + 1) - 1] + datos[int( n / 2)] - 1) / 2
    else: # Si es impar la formula es: Me = X((n + 1) / 2)
        mediana = datos[int((n + 1) / 2) - 1]
    return mediana

#Obtener la varianza
def varianza(datos):
    v_media = media(datos)
    varianzalist = []
    for i in datos:
        i = pow((i - v_media), 2)
        varianzalist.append(i)

    v_varianza = sum(varianzalist) / len(varianzalist)
    return v_varianza

#Obtener la desviacion Estandar
def desviacionEstandar(datos):
    desviacion = sqrt(varianza(datos))
    return desviacion
    
def fibonacci(numero):
	if numero == 0:
		return0
	elif numero == 1:
		return1
	else:
		return fibonacci(numero-1) + fibonacci(numero - 2)





# Probando el algoritmo 

datos = [14,15,15,15,16,17,18,19,20]
print varianza(datos)
print desviacionEstandar(datos)
