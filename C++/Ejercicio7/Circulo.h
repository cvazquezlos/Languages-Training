/*
 * Circulo.h
 *
 *  Created on: 7/12/2017
 *      Author: cvazquel
 */

#ifndef CIRCULO_H_
#define CIRCULO_H_

#include "Figura.h"
#include <string>

class Circulo: public Figura {
public:
	Circulo(std::string, double);
	virtual ~Circulo();

	double area() const;
	double perimetro() const;
	void mostrar() const;

	friend std::ostream& operator<<(std::ostream&, const Circulo&);

private:
	double radio;
};

#endif /* CIRCULO_H_ */
