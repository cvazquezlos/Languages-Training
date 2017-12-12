/*
 * tSpreadsheet.cpp
 *
 *  Created on: 6/12/2017
 *      Author: cvazquel
 */

#include "tSpreadsheet.h"
#include <string>
#include <fstream>

using namespace std;

tSpreadsheet *loadCsvFile(const string filename) {
	tSpreadsheet* result = new tSpreadsheet;
	ifstream in (filename.c_str());
	int rows;
	int cols;
	(in >> rows) >> cols;
	result->numRows = rows;
	result->numCols = cols;
	result->content = new int*[rows];

	for (int i=0; i<rows; i++) {
		result->content[i] = new int[cols];
		for (int j=0; j<cols; j++) {
			in >> result->content[i][j];
		}
	}

	in.close();

	return result;
}

int saveCsvFile(tSpreadsheet* data, const std::string filename) {
	ofstream out (filename.c_str());
	(out << data->numRows) << data->numCols;
	int rows = data->numRows;
	int cols = data->numCols;

	for (int i=0; i<rows; i++) {
		for (int j=0; j<cols; j++) {
			out << data->content[i][j];
		}
	}

	out.close();

	return 0;
}

int sumRow(tSpreadsheet* data, unsigned int rowIndex) {
	int suma = 0;

	for (unsigned int j=0; j<(data->numCols); j++) {
		suma += data->content[rowIndex][j];
	}

	return suma;
}

int sumCol(tSpreadsheet* data, unsigned int colIndex) {
	int suma = 0;

	for (unsigned int i=0; i<data->numRows; i++) {
		suma += data->content[i][colIndex];
	}

	return suma;
}

int deleteData(tSpreadsheet* data) {
	for (unsigned int i=0; i<data->numRows; i++) {
		delete [] data->content[i];
	}
	delete [] data->content;
	delete data;
	return 0;
}
