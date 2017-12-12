/*
 * Figura.h
 *
 *  Created on: 7/12/2017
 *      Author: cvazquel
 */

#ifndef FIGURA_H_
#define FIGURA_H_

#include <string>

class Figura {
public:
	Figura(std::string color): color(color) {};
	virtual ~Figura();

	virtual double area() const=0;
	virtual double perimetro() const=0;
	virtual void mostrar() const=0;

protected:
	std::string getColor() const { return color; };

private:
	std::string color;
};

#endif /* FIGURA_H_ */
