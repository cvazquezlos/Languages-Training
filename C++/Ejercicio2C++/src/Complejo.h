/*
 * Complejo.h
 *
 *  Created on: 1/12/2017
 *      Author: guillermourbano
 */

#ifndef Complejo_H_
#define Complejo_H_

#include <iostream>
#include "math.h"

using namespace std;

class Complejo {
public:
	Complejo(); 										// Constructor vacío
	virtual ~Complejo(); 								// Destructor
	Complejo(float, float);
	Complejo (const Complejo&);
	int getReal(void){return real;};
	int getImag(void){return imag;}; 					//Se pueden definir en .h los métodos que ocupen una sola linea
	void setReal(int& r){real=r;}; 						//int& - referencia a variable inicializada al valor de r
	void setImag(int& i){imag=i;};
	float module();
	Complejo operator+ (Complejo&);
	bool operator== (const Complejo&);					//const Complejo& - Indica que el valor Complejo es una constante y no se puede modificar en el metodo
	friend ostream& operator<< (ostream&,const Complejo&);		//funcion friend de una clase es definida fuera de esa clase pero puede acceder a todos los miembros privados y protegidos de esa clase
private:
	int real;
	int imag;
};

#endif /* Complejo_H_ */
