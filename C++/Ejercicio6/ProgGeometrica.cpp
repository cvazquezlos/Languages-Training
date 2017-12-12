/*
 * ProgGeometrica.cpp
 *
 *  Created on: 8/12/2017
 *      Author: cvazquel
 */

#include "ProgGeometrica.h"
#include <math.h>

ProgGeometrica::ProgGeometrica(int p, int n, int r): Sucesion(p, n), razon(r) {}

ProgGeometrica::~ProgGeometrica() {}

double ProgGeometrica::suma() const {
	int n = getNumElementos();
	return (getPrimero() * (pow(razon, n) - 1)) / (razon - 1);
}

int ProgGeometrica::elementoN(int n) const {
	if (getNumElementos() < n)
		n = getNumElementos();
	return getPrimero() * pow(razon, n-1);
}
