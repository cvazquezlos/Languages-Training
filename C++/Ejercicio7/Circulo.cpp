/*
 * Circulo.cpp
 *
 *  Created on: 7/12/2017
 *      Author: cvazquel
 */

#include "Circulo.h"
#include <cmath>
#include <iostream>
#include <string>

using namespace std;

Circulo::Circulo(string c, double r): Figura(c), radio(r) {}

Circulo::~Circulo() {}

double Circulo::area() const {
	return M_PI * radio * radio;
}

double Circulo::perimetro() const {
	return 2 * M_PI * radio;
}

ostream& operator<<(ostream& out, const Circulo& c) {
	out << "Datos Circulo Color: " << c.getColor();
	out << " Area: " << c.area();
	out << " Perimetro: " << c.perimetro() << endl;
	return out;
}

void Circulo::mostrar() const {
	cout << *this << endl;
}
