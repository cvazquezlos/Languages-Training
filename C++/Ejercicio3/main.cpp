/*
 * main.cpp
 *
 *  Created on: 6/12/2017
 *      Author: cvazquel
 */

#include "Spreadsheet.h"
#include <iostream>
#include <string>

using namespace std;

int main() {
	Spreadsheet* s1 = new Spreadsheet();
	Spreadsheet* s2 = new Spreadsheet (2, 3);
	Spreadsheet* s3 = new Spreadsheet(*s2);

	cout << s1->getCols() << endl;
	cout << s2->getRows() << endl;

	cout << s3->loadCsvFile("entrada.txt") << endl;
	cout << s2->saveCsvFile("salida1.txt") << endl;
	cout << s3->saveCsvFile("salida2.txt") << endl;

	s3->width(1, 1, 100).width(1, 2, 200);
}
