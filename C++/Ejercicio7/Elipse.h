/*
 * Elipse.h
 *
 *  Created on: 8/12/2017
 *      Author: cvazquel
 */

#ifndef ELIPSE_H_
#define ELIPSE_H_

#include "Figura.h"
#include <string>

class Elipse: public Figura {
public:
	Elipse(std::string, double, double);
	virtual ~Elipse();

	double area() const;
	double perimetro() const;
	void mostrar() const;

	friend std::ostream& operator<<(std::ostream&, const Elipse&);

private:
	double semiejeM, semiejem;
};

#endif /* ELIPSE_H_ */
