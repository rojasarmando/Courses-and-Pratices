/*
	Uso de Estructura

	by: Armando Rojas

	UNEFA_II-2016

	Ing Sistemas 5to Semestre
*/

#include<iostream>
#include<iomanip>
#include<string.h>
using namespace std;

const int MAX=6;

struct Datos {
	int cod,edad;
	char nom[20],sexo;
};

//PROTOTIPOS
Datos vacio();
void incluir(Datos Alumnos[MAX]);
Datos leer(Datos Alumnos[MAX]);
void mostrar(Datos Alumno);
void mostrar2(Datos Alumno);
int disponible (Datos Alumno[MAX]);
int BuscaCod(Datos Alumno[MAX],int aux);
int BuscaNom(Datos Alumnos[MAX],char nombre[20]);
void ConsultaC(Datos Alumno[MAX]);
void modifica(Datos Alumno[MAX]);
void elimina(Datos Alumno[MAX]);
void limpiar(Datos Alumno[MAX]);
void listar(Datos Alumno[MAX]);
char menu();
void ConsultaN(Datos Alumno[MAX]);

int main() {
	char opcion;
	Datos Alumnos[MAX];
	limpiar(Alumnos);
	while ((opcion=menu())!='0') {
		switch (opcion) {
			case '1':incluir(Alumnos); break;
			case '2':ConsultaC(Alumnos); break;
			case '3':ConsultaN(Alumnos); break;
			case '4':modifica(Alumnos); break;
			case '5':elimina(Alumnos); break;
			case '6':listar(Alumnos); break;
			default:cout<<"Opcion no valida"<<endl;
		}
	}
	return 0;

}

char menu() {
	char opcion;
	cout<<"1..Registrar"<<endl<<"2..Consulta Codigo"<<endl<<"3..Consulta Nombre"<<endl
	<<"4..Modificar"<<endl<<"5..Borrar"<<endl<<"6..Listar"<<endl<<"0..Salir"<<endl
	<<"OPCION= "; cin>>opcion;
	return opcion;
}

void listar(Datos Alumno[MAX]) {
	if (Alumno[0].cod!=0) {
		cout<<setw(8)<<"Codigo"<<setw(8)<<"Nombre"<<setw(8)<<"Edad"<<setw(8)
		<<"Sexo"<<endl;
		for (int i=0; i<MAX&&Alumno[i].cod!=0; mostrar2(Alumno[i++]));
	}
	else
		cout<<"\tNo se ha registrado ningun alumno"<<endl;
}

void limpiar(Datos Alumno[MAX]) {
	for (int i=0; i<MAX; Alumno[i++]=vacio());
}

void elimina(Datos Alumno[MAX]) {
	int numero;
	char resp;
	do {
		cout<<"\tIntroduzca el codigo del alumno que desea eliminar"<<endl; cin>>numero;
		if ((numero=BuscaCod(Alumno,numero))!=MAX)
			for (; numero<MAX-1; numero++) {
				Alumno[numero]=Alumno[numero+1];
			Alumno[numero]=vacio();
		}
		else
			cout<<"\tAlumno no existe"<<endl;
		cout<<"\tDesea volver a repetir la operacion s=si n=no"<<endl; cin>>resp;
	} while (resp=='s'||resp=='S');
}

Datos vacio() {
	Datos Alumno;
	Alumno.cod=Alumno.edad=0;
	Alumno.nom[0]='\0';
	Alumno.sexo=' ';
	return Alumno;
}

void modifica(Datos Alumno[MAX]) {
	int numero;
	char resp;
	do {
		cout<<"\tIntroduxca el codigo del alumno que desea modificar"<<endl; cin>>numero;
		if ((numero=BuscaCod(Alumno,numero))!=MAX)
			Alumno[numero]=leer(Alumno);
		else
			cout<<"\tAlumno no existe"<<endl;
		cout<<"\tDesea volver a repetir la operacion s=si n=no"<<endl; cin>>resp;
	} while (resp=='s'||resp=='S');
}

void ConsultaN(Datos Alumno[MAX]) {
	char nombre[20];
	int indice;
	do {
		cout<<"\tIngrese el nombre del alumno a consultar"<<endl; cin>>nombre;
		if ((indice=BuscaNom(Alumno,nombre))!=MAX)
			mostrar(Alumno[indice]);
		else
			cout<<"\tNo existe un alumno con ese nombre"<<endl;
		cout<<"\tDesea volver a repetir la operacion s=si n=no"<<endl; cin>>nombre[0];
	} while (nombre[0]=='s'||nombre[0]=='S');
}

void ConsultaC(Datos Alumno[MAX]) {
	int numero;
	char resp;
	do {
		cout<<"\tIngrese el codigo a consultar"<<endl; cin>>numero;
		if ((numero=BuscaCod(Alumno,numero))!=MAX)
			mostrar(Alumno[numero]);
		else
			cout<<"\tNo existe"<<endl;
		cout<<"\tDesea volver a repetir la operacion s=si n=no"<<endl; cin>>resp;
	} while (resp=='s'||resp=='S');
}

void incluir(Datos Alumnos[MAX]) {
	int indice;
	char resp;
	do {
		if ((indice=disponible(Alumnos))!=MAX)
			Alumnos[indice]=leer(Alumnos);
		else
			cout<<"\tNo hay espacio Disponible elimine al menos un alumno para incluir"<<endl;
		cout<<"\tDesea volver a repetir la operacion s=si n=no"<<endl; cin>>resp;
	} while (resp=='s'||resp=='S');
}

Datos leer(Datos Alumnos[MAX]) {
	Datos Alumno;
	cout<<"\tCodigo: ";
	do {
		cin>>Alumno.cod;
		if (BuscaCod(Alumnos,Alumno.cod)!=MAX) cout<<"\tYa hay un alumno con este codigo ingrese de nuevo"<<endl;
	} while (BuscaCod(Alumnos,Alumno.cod)!=MAX);
	cout<<"\tNombre: "; cin>>Alumno.nom;
	cout<<"\tEdad: "; cin>>Alumno.edad;
	cout<<"\tSexo: "; cin>>Alumno.sexo;
	return Alumno;
}

void mostrar(Datos Alumno) {
	cout<<"\tCodigo: "<<Alumno.cod<<endl
	<<"\tNombre: "<<Alumno.nom<<endl
	<<"\tEdad: "<<Alumno.edad<<endl<<"\tSexo: "<<Alumno.sexo<<endl;
}

void mostrar2(Datos Alumno) {
	cout<<setw(8)<<Alumno.cod<<setw(8)<<Alumno.nom<<setw(8)
	<<Alumno.edad<<setw(8)<<Alumno.sexo<<endl;
}

int disponible (Datos Alumno[MAX]) {
	int indice;
	for (indice=0; indice<MAX&&Alumno[indice].cod!=0; indice++);
	return indice;
}

int BuscaCod(Datos Alumno[MAX],int aux) {
	int indice;
	for (indice=0; indice<MAX&&Alumno[indice].cod!=aux; indice++);
	return indice;
}

int BuscaNom(Datos Alumnos[MAX],char nombre[20]) {
	int indice;
	for (indice=0; indice<MAX&&strcmp(Alumnos[indice].nom,nombre)!=0; indice++);
	return indice;
}
