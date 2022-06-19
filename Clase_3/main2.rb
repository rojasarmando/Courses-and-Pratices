# Manejo de Arrays
a = []


a.push(32)

a << 32

a.unshift(32) # agregar al principio del array

a.insert(3, 'hola') # insertar hola en la posicion del array

# eliminar elementos en un array

a.pop # eliminar ultimo elemento
a.shift # elimina el primer elemento

a.delete_at(4) # elimina el indice 4

a.uniq # return elementos unicos

a.uniq! # los elimnas del array


#parametro del array


a[2..4]

a.last # ultimo
a.first # primero

a.take(2) # obtener 2 elementos
a.drop(2) # descartar los 2 primeros elementos