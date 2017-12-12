/*
 * ProgAritmetica.cpp
 *
 *  Created on: 8/12/2017
 *      Author: cvazquel
 */

#include "ProgAritmetica.h"

ProgAritmetica::ProgAritmetica(int p, int n, int d): Sucesion(p, n), diferencia(d) {}

ProgAritmetica::~ProgAritmetica() {}

double ProgAritmetica::suma() const {
	int n = getNumElementos();
	return ((getPrimero() + elementoN(n)) / 2.0) * n;
}

int ProgAritmetica::elementoN(int n) const {
	if (getNumElementos() < n)
		n = getNumElementos();
	return (getPrimero() + (n-1)) * diferencia;
}
