/*
 * Cuadrado.h
 *
 *  Created on: 8/12/2017
 *      Author: cvazquel
 */

#ifndef CUADRADO_H_
#define CUADRADO_H_

#include "Figura.h"
#include <string>

class Cuadrado: public Figura {
public:
	Cuadrado(std::string, double);
	virtual ~Cuadrado();

	double area() const;
	double perimetro() const;
	void mostrar() const;

	friend std::ostream& operator<<(std::ostream&, const Cuadrado&);

private:
	double lado;
};

#endif /* CUADRADO_H_ */
