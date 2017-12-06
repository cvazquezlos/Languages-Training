/*
 * Complejo.cpp
 *
 *  Created on: 5/12/2017
 *      Author: Pedro R Portatil
 */


#include "Complejo.h"

#include "math.h"
#include <iostream>
using namespace std;


Complejo::Complejo() {
// TODO Auto-generated constructor stub
	real=0;								//Si no inicializas las variables no funciona
	imag=0;
}

Complejo::~Complejo() {
// TODO Auto-generated destructor stub
}

Complejo::Complejo(float r,float i){	//Recibe como parametros dos varibles para el constructor
	real=r;
	imag=i;
}

Complejo::Complejo (const Complejo& c){	//Recibe como parametro una clase complejo para el constructor
	imag = c.imag;
	real= c.real;
}

float Complejo::module(){
	return sqrt(real*real + imag*imag);
}

Complejo Complejo::operator+(Complejo& c){
	Complejo resultado;
	resultado.real=real+c.real;
	resultado.imag=imag+c.imag;
	return resultado;
}

bool Complejo::operator==(const Complejo& c){
	return (real==c.real)&&(imag==c.imag);
}

//Convierte un numero complejo en una cadena
//std::ostream& operator<< (std::ostream& o, const Complejo& c){	//Si incluyes std (using namespace std;) en Complejo.h, nohace falta referenciarlo de nuevo (metodos, variables)
ostream& operator<< (ostream& o, const Complejo& c){
	o<<c.real<<" ";			//<< - Variable de flujo: le pasa c.real a o, y de o a string (" ")
	o<<c.imag<<"i";
	return o;
}


