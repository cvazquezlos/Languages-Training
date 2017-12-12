/*
 * Cuadrado.cpp
 *
 *  Created on: 8/12/2017
 *      Author: cvazquel
 */

#include "Cuadrado.h"
#include <iostream>
#include <string>

using namespace std;

Cuadrado::Cuadrado(string c, double l): Figura(c), lado(l) {}

Cuadrado::~Cuadrado() {}

double Cuadrado::area() const {
	return lado * lado;
}

double Cuadrado::perimetro() const {
	return lado * 4;
}

ostream& operator<<(ostream& out, const Cuadrado& c) {
	out << "Datos Cuadrado Color: " << c.getColor();
	out << " Area: " << c.area();
	out << " Perimetro: " << c.perimetro();
	return out;
}

void Cuadrado::mostrar() const {
	cout << *this << endl;
}
