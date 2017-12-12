/*
 * TextCell.cpp
 *
 *  Created on: 7/12/2017
 *      Author: cvazquel
 */

#include "TextCell.h"
#include <string>

using namespace std;

TextCell::TextCell(int f, int c, string v): Cell(f, c), valor(v) {}

TextCell::~TextCell() {}

Cell* TextCell::createCopy() {
	return new TextCell(getFila(), getColumna(), valor);
}

int TextCell::getCellValueAsInt() {
	return 0;
}

double TextCell::getCellValueAsDouble() {
	return 0;
}

string TextCell::getCellValueAsString() {
	return valor;
}
