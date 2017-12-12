/*
 * Elipse.cpp
 *
 *  Created on: 8/12/2017
 *      Author: cvazquel
 */

#include "Elipse.h"
#include <cmath>
#include <iostream>
#include <string>

using namespace std;

Elipse::Elipse(string c, double M, double m): Figura(c), semiejeM(M), semiejem(m) {}

Elipse::~Elipse() {}

double Elipse::area() const {
	return M_PI * semiejeM * semiejem;
}

double Elipse::perimetro() const {
	return double ((2 * M_PI) * (pow((((pow(semiejeM, 2))+(pow(semiejem, 2)))/2.0), (1/2))));
}

ostream& operator<<(ostream& out, const Elipse& c) {
	out << "Datos Elipse Color: " << c.getColor();
	out << " Area: " << c.area();
	out << " Perimetro: " << c.perimetro() << endl;
	return out;
}

void Elipse::mostrar() const {
	cout << *this << endl;
}
