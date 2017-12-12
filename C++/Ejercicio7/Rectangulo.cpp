/*
 * Rectangulo.cpp
 *
 *  Created on: 8/12/2017
 *      Author: cvazquel
 */

#include "Rectangulo.h"
#include <iostream>
#include <string>

using namespace std;

Rectangulo::Rectangulo(string c, double b, double a): Figura(c), base(b), altura(a) {}

Rectangulo::~Rectangulo() {}

double Rectangulo::area() const {
	return (base * altura);
}

double Rectangulo::perimetro() const {
	return (base * 2) + (altura * 2);
}

ostream& operator<<(ostream& out, const Rectangulo& c) {
	out << "Datos Rectangulo Color: " << c.getColor();
	out << " Area: " << c.area();
	out << " Perimetro: " << c.perimetro() << endl;
	return out;
}

void Rectangulo::mostrar() const {
	cout << *this << endl;
}
