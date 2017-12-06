

#include <iostream>
#include "Matriz.h"
using namespace std;


Matriz::~Matriz() { // Destructor
	// TODO Auto-generated destructor stub
}

Matriz::Matriz():fila(0),col(0) {				// Lista de inicializadores (o se puede inicializar debajo también)
    datos=NULL;									//Esto es similar al NULL
}

Matriz::Matriz(const Matriz& m){  				// Constructor recibe matriz
	*this=m; 									//Ya se encarga el constructor de copia
	// Mi direccion de memoria va a apuntar a la matriz que se pasa por referencia. Es como un puntero a una referencia
}


Matriz::Matriz(int r, int c):fila(r),col(c) {	// Lista de inicializadores
	datos =new int*[fila]; // Va rellenando la matriz
	int valor =0;
	for (int i=0;i<fila;i++){
		datos[i]=new int[col];
		for(int j=0;j<col;j++){
			cout<<"Input row: "<<i<<" column: "<< j << endl;
			// Se queda esperando a que introduzcas un valor para la fila y columna
			cin>>valor; 						// cin es la entrada estandar
			datos[i][j]=valor;
		}
	}
	Matriz::contador++; // Se suma el contador de veces que se rellena
}



ostream& operator<<(ostream& o,const Matriz& m){
	o<<"[";
	for (int i=0;i<m.fila;i++){
		o<<" [";
		for(int j=0;j<m.col;j++){
			cout<<m.datos[i][j]<<" ";
		}
		o<<"]";
	}
	o<<" ]"<<std::endl;
	return o;
}

Matriz operator+ (const Matriz& m1, const Matriz& m2){
	Matriz resultado=Matriz();
	if (m1.esCompatible(m2)){
		resultado.fila=m1.fila;
		resultado.col=m2.col;
		resultado.datos = new int*[m1.fila];
		for (int i=0;i<m1.fila;i++){
			resultado.datos[i]=new int[m1.col];
			for(int j=0;j<m1.col;j++){
				resultado.datos[i][j]=m1.datos[i][j]+m2.datos[i][j];
			}
		}
	}
	return resultado;
}

Matriz operator- (const Matriz& m1, const Matriz& m2){
	Matriz resultado=Matriz();
	if (m1.esCompatible(m2)){
		resultado.fila=m1.fila;
		resultado.col=m2.col;
		resultado.datos = new int*[m1.fila];
		for (int i=0;i<m1.fila;i++){
			resultado.datos[i]=new int[m1.col];
			for(int j=0;j<m1.col;j++){
				resultado.datos[i][j]=m1.datos[i][j]-m2.datos[i][j] ;
			}
		}
	}
	return resultado;
}

Matriz operator* (const Matriz& m1, const Matriz& m2){
	Matriz resultado =Matriz();
	if (m1.esCompatibleMult(m2)){
		resultado.fila=m1.fila;
		resultado.col=m2.col;
		resultado.datos = new int*[m1.fila];
		for (int i=0;i<m1.fila;i++){
			resultado.datos[i]=new int[m2.col];
			for(int j=0;j<m2.col;j++){
				int res =0;
				for (int k=0;k<m1.col;k++){
					res=res+m1.datos[i][k]*m2.datos[k][j];
				}
				resultado.datos[i][j]=res;
			}
		}
	}
return resultado;
}

bool Matriz::operator== (const Matriz& m2){
	if ((m2.fila==fila)&&(m2.col==col)){
		bool iguales=true;
		for (int i=0;i<fila;i++){
			for(int j=0;j<col;j++){
				iguales=iguales&&(datos[i][j]==m2.datos[i][j]);
			}
		}
		return iguales;

	} else {
		return false;
	}
}

bool Matriz::operator!= (const Matriz& m2){
	return !((*this)==(m2));
}

Matriz& Matriz::with(int r, int c, int v){ this->datos[r][c]=v;
	return *this;
}

Matriz& Matriz::operator+=(const Matriz& m){
	for (int i=0;i<fila;i++){
		for(int j=0;j<col;j++){
			datos[i][j]+=m.datos[i][j];
		}
	}
	return *this;
}



Matriz& Matriz::operator=(const Matriz& m2){
	bool igualdim = (col==m2.col)&&(fila==m2.fila);
	if(igualdim){
		for(int i=0;i<fila;i++)
			for(int j=0;j<col;j++)
				datos[i][j]=m2.datos[i][j];
	}
	else{
		for(int i=0;i<fila;i++) delete [] datos[i];
		//borro los datos que hubiera
		delete [] datos;
		fila=m2.fila;
		col=m2.col;
		datos=new int*[fila];
		for (int i=0; i<fila;i++){
			datos[i]=new int[col];
			for (int j=0;j<col;j++){
				datos[i][j]=m2.datos[i][j];
			}

		}
	}
	contador++;
	cout<<"copia";
	return (*this);
}

bool Matriz::esCompatible(const Matriz& m2)const{
	return ((fila==m2.fila)&&(col==m2.col));
}

bool Matriz::esCompatibleMult(const Matriz& m2)const{
	return (col==m2.fila);
}

int& Matriz::operator()(int r,int c){
	return datos[r][c];
}

const int& Matriz::operator()(int r,int c)const{
	return datos[r][c];
}

int Matriz::contador=0;

Matriz Matriz::getIdentityMatriz(int dim){
	Matriz result;
	result.fila=dim;
	result.col=dim;
	result.datos = new int*[result.fila]; for (int i=0;i<result.fila;i++){
	return result; contador++;
}

 }




