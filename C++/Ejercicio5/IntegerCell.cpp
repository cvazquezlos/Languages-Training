/*
 * IntegerCell.cpp
 *
 *  Created on: 7/12/2017
 *      Author: cvazquel
 */

#include "IntegerCell.h"
#include <sstream>
#include <string>

using namespace std;

IntegerCell::IntegerCell(int f, int c, int v): Cell(f, c), valor(v) {}

IntegerCell::~IntegerCell() {}

Cell* IntegerCell::createCopy() {
	return new IntegerCell(getFila(), getColumna(), valor);
}

int IntegerCell::getCellValueAsInt() {
	return valor;
}

double IntegerCell::getCellValueAsDouble() {
	return double (valor);
}

string IntegerCell::getCellValueAsString() {
	std::stringstream s;
	s << valor;
	return s.str();
}
