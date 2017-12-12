/*
 * main.cpp
 *
 *  Created on: 7/12/2017
 *      Author: cvazquel
 */

#include "Cell.h"
#include "FloatingPointCell.h"
#include "IntegerCell.h"
#include "TextCell.h"

#include <iostream>
#include <string>

using namespace std;

int main() {
	FloatingPointCell* c1 = new FloatingPointCell(3, 5, 5.6);
	cout << "Imprimiendo valores de c1..." << endl;
	cout << "Valor entero: " << c1->getCellValueAsInt() << endl;
	cout << "Valor decimal: " << c1->getCellValueAsDouble() << endl;
	cout << "Valor carácter: " << c1->getCellValueAsString() << endl;

	IntegerCell* c2 = new IntegerCell(3, 5, 8);
	cout << "Imprimiendo valores de c2..." << endl;
	cout << "Valor entero: " << c2->getCellValueAsInt() << endl;
	cout << "Valor decimal: " << c2->getCellValueAsDouble() << endl;
	cout << "Valor carácter: " << c2->getCellValueAsString() << endl;

	TextCell* c3 = new TextCell(3, 5, "hola");
	cout << "Imprimiendo valores de c3..." << endl;
	cout << "Valor entero: " << c3->getCellValueAsInt() << endl;
	cout << "Valor decimal: " << c3->getCellValueAsDouble() << endl;
	cout << "Valor carácter: " << c3->getCellValueAsString() << endl;
}
