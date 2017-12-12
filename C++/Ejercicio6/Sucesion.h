/*
 * Sucesion.h
 *
 *  Created on: 8/12/2017
 *      Author: cvazquel
 */

#ifndef SUCESION_H_
#define SUCESION_H_

class Sucesion {
public:
	Sucesion(int, int);
	virtual ~Sucesion();

	virtual double suma() const;
	virtual int elementoN(int) const;

protected:
	int getPrimero() const { return primero; };
	int getNumElementos() const { return numElementos; };

private:
	int primero;
	int numElementos;
};

#endif /* SUCESION_H_ */
