/*
 * Complex.cpp
 *
 *  Created on: 6/12/2017
 *      Author: cvazquel
 */

#include "Complex.h"
#include <math.h>
#include <string>

using namespace std;

Complex::Complex(): imag(0), real(0) {}

Complex::Complex(int imag, int real): imag(imag), real(real) {}

Complex::Complex(const Complex& c): imag(c.imag), real(c.real) {}

Complex::~Complex() {}

double Complex::abs() const {
	return sqrt(real*real + imag*imag);
}

bool Complex::operator==(const Complex& c) const{
	return (real==c.real) && (imag==c.imag);
}

Complex& Complex::operator+(const Complex& c) const {
	Complex resultado;
	resultado.real = real + c.real;
	resultado.imag = imag + c.imag;
	return resultado;
}

std::ostream& operator<<(std::ostream& out, const Complex& c) {
	out << c.real << " ";
	out << c.imag << "i";
	return out;
}
