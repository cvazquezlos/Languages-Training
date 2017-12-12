/*
 * ProgGeometrica.h
 *
 *  Created on: 8/12/2017
 *      Author: cvazquel
 */

#ifndef PROGGEOMETRICA_H_
#define PROGGEOMETRICA_H_

#include "Sucesion.h"

class ProgGeometrica: public Sucesion {
public:
	ProgGeometrica(int, int, int);
	virtual ~ProgGeometrica();

	double suma() const;
	int elementoN(int) const;

private:
	int razon;
};

#endif /* PROGGEOMETRICA_H_ */
