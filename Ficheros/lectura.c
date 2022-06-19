#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
	FILE *ptr_fichero;
  	char nombre_fichero[] = "texto.txt";

	pantalla();

	if ( (ptr_fichero = fopen(nombre_fichero, "r") ) == NULL) {
   	 printf("No se ha podido abrir el fichero %s.\n", nombre_fichero);

  	}else{

  		printf("exito");
  	}
	return 0;
}


	
