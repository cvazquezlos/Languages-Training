/*
 * Spreadsheet.cpp
 *
 *  Created on: 6/12/2017
 *      Author: cvazquel
 */

#include "Spreadsheet.h"
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

Spreadsheet::Spreadsheet(): rows(0), cols(0) {
	content = NULL;
}

Spreadsheet::Spreadsheet(const Spreadsheet& s) {
	*this = s;
}

Spreadsheet::~Spreadsheet() {}

unsigned int Spreadsheet::getRows() const {
	return rows;
}

unsigned int Spreadsheet::getCols() const {
	return cols;
}

int Spreadsheet::sumRow(unsigned int rowIndex) const {
	int suma = 0;
	for (unsigned int j=0; j<cols; j++) {
		suma += content[rowIndex][j];
	}
	return suma;
}

bool Spreadsheet::loadCsvFile(string filename) {
	ifstream in (filename.c_str());
	(in >> rows) >> cols;
	content = new int *[rows];
	for (unsigned int i=0; i<rows; i++) {
		content[i] = new int[cols];
		for (unsigned int j=0; j<cols; j++) {
			in >> content[i][j];
		}
	}
	in.close();
	return true;
}

bool Spreadsheet::saveCsvFile(string filename) const {
	ofstream out (filename.c_str());
	(out << rows) << " " << cols << endl;
	for (unsigned int i=0; i<rows; i++) {
		for (unsigned int j=0; j<cols; j++) {
			out << content[i][j] << " ";
		}
		out << endl;
	}
	out.close();
	return true;
}

Spreadsheet& Spreadsheet::width(int r, int c, int v) {
	content[r][c] = v;
	return *this;
}

void Spreadsheet::initialize(unsigned int r, unsigned int c, int d) {
	rows = r;
	cols = c;
	content = new int *[rows];
	for (unsigned int i=0; i<rows; i++) {
		content[i] = new int [cols];
		for (unsigned int j=0; j<cols; j++) {
			content[i][j] = d;
		}
	}
}
