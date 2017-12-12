/*
 * FloatingPointCell.cpp
 *
 *  Created on: 7/12/2017
 *      Author: cvazquel
 */

#include "FloatingPointCell.h"
#include <sstream>
#include <string>

using namespace std;

FloatingPointCell::FloatingPointCell(int f, int c, double v): Cell(f, c), valor(v) {}

FloatingPointCell::~FloatingPointCell() {}

Cell* FloatingPointCell::createCopy() {
	return new FloatingPointCell(getFila(), getColumna(), valor);
}

int FloatingPointCell::getCellValueAsInt() {
	return int (valor);
}

double FloatingPointCell::getCellValueAsDouble() {
	return valor;
}

string FloatingPointCell::getCellValueAsString() {
	std::stringstream s;
	s << valor;
	return s.str();
}
