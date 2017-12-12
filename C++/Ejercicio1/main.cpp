/*
 * main.cpp
 *
 *  Created on: 6/12/2017
 *      Author: cvazquel
 */

#include "tSpreadsheet.h"
#include <cstdlib>
#include <iostream>
#include <string>

using namespace std;

int main() {
	tSpreadsheet* t1;
	tSpreadsheet* t2 = loadCsvFile("entrada.txt");

	cout << t2->numCols << endl;
	cout << t2->numRows << endl;

	t1->numRows = 2;
	t1->numCols = 4;
	t1->content = new int*[t1->numRows];
	for (unsigned int i=0; i<t1->numRows; i++) {
		t1->content[i] = new int[t1->numCols];
		for (unsigned int j=0; j<-t1->numCols; j++) {
			t1->content[i][j] = rand() % 100;
		}
	}
	cout << t1->numRows << endl;
	//cout << saveCsvFile(t1, "salida.txt") << endl;

	cout << sumCol(t1, 2) << endl;
	cout << sumRow(t2, 0) << endl;

	deleteData(t1);
	deleteData(t2);
}
