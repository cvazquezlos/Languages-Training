/*
 * Rectangulo.h
 *
 *  Created on: 8/12/2017
 *      Author: cvazquel
 */

#ifndef RECTANGULO_H_
#define RECTANGULO_H_

#include "Figura.h"
#include <string>

class Rectangulo: public Figura {
public:
	Rectangulo(std::string, double, double);
	virtual ~Rectangulo();

	double area() const;
	double perimetro() const;
	void mostrar() const;

	friend std::ostream& operator<<(std::ostream&, const Rectangulo&);

private:
	double base, altura;
};

#endif /* RECTANGULO_H_ */
