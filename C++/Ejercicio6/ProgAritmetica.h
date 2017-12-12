/*
 * ProgAritmetica.h
 *
 *  Created on: 8/12/2017
 *      Author: cvazquel
 */

#ifndef PROGARITMETICA_H_
#define PROGARITMETICA_H_

#include "Sucesion.h"

class ProgAritmetica: public Sucesion {
public:
	ProgAritmetica(int, int, int);
	virtual ~ProgAritmetica();

	double suma() const;
	int elementoN(int) const;

private:
	int diferencia;
};

#endif /* PROGARITMETICA_H_ */
