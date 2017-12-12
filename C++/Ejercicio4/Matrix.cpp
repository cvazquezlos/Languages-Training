/*
 * Matrix.cpp
 *
 *  Created on: 7/12/2017
 *      Author: cvazquel
 */

#include "Matrix.h"
#include <iostream>
#include <string>

using namespace std;

Matrix::Matrix(): rows(0), cols(0) {
	content = NULL;
}

Matrix::Matrix(const Matrix& m) {
	*this = m;
}

Matrix::Matrix(int r, int c): rows(r), cols(c) {
	content = new int *[rows];
	for (unsigned int i=0; i<rows; i++) {
		content[i] = new int [cols];
		for (unsigned int j=0; j<cols; j++) {
			content[i][j] = 0;
		}
	}
}

Matrix::Matrix(int r, int c, int** m): rows(r), cols(c) {
	content = new int *[rows];
	for (unsigned int i=0; i<rows; i++) {
		content[i] = new int [cols];
		for (unsigned int j=0; j<cols; j++) {
			content[i][j] = m[i][j];
		}
	}
}

Matrix::~Matrix() {
	// TODO Auto-generated destructor stub
}

Matrix& Matrix::operator+(const Matrix& m) const {
	Matrix* result = new Matrix(rows, cols);
	if (esCompatible(*this, m)) {
		for (unsigned int i=0; i<rows; i++) {
			for (unsigned int j=0; j<cols; j++) {
				result->content[i][j] = content[i][j] + m.content[i][j];
			}
		}
	}
	return *result;
}

Matrix& Matrix::operator-(const Matrix& m) const {
	Matrix* result = new Matrix(rows, cols);
	if (esCompatible(*this, m)) {
		for (unsigned int i=0; i<rows; i++) {
			for (unsigned int j=0; j<cols; j++) {
				result->content[i][j] = content[i][j] - m.content[i][j];
			}
		}
	}
	return *result;
}

Matrix& Matrix::operator*(const Matrix& m) const {
	Matrix* result = new Matrix(rows, cols);
	if (esCompatible(*this, m)) {
		for (unsigned int i=0; i<rows; i++) {
			for (unsigned int j=0; j<cols; j++) {
				result->content[i][j] = content[i][j] * m.content[i][j];
			}
		}
	}
	return *result;
}

Matrix& Matrix::operator=(const Matrix& m) {
	if (!esCompatible(*this, m)) {
		for (unsigned int i=0; i<rows; i++) {
			delete [] content[i];
		}
		delete [] content;
		rows = m.rows;
		cols = m.cols;
		content = new int *[rows];
		for (unsigned int i=0; i<rows; i++) {
			content[i] = new int[cols];
		}
	}
	for (unsigned int i=0; i<rows; i++) {
		for (unsigned int j=0; j<cols; j++) {
			content[i][j] = m.content[i][j];
		}
	}
	return *this;
}

ostream& operator<<(ostream& o, const Matrix& m){
	o<<"[";
	for (unsigned int i=0;i<m.rows;i++){
		o<<" [";
		for(unsigned int j=0;j<m.cols;j++){
			cout << m.content[i][j] << " ";
		}
		o<<"]";
	}
	o<<" ]"<<std::endl;
	return o;
}

bool Matrix::operator==(const Matrix& m) const {
	if ((rows == m.rows) && (cols == m.cols)) {
		for (unsigned int i=0; i<rows; i++) {
			for (unsigned int j=0; j<cols; j++) {
				if (content[i][j] != m.content[i][j]) {
					return false;
				}
			}
		}
		return true;
	} else {
		return false;
	}
}

bool Matrix::operator!=(const Matrix& m) const {
	return !(*this == m);
}

int Matrix::operator()(const unsigned int r, const unsigned int c) const {
	return content[r][c];
}

Matrix& Matrix::getIdentityMatrix(const unsigned int size) {
	Matrix* result = new Matrix(size, size);
	for (unsigned int i=0; i<result->rows; i++) {
		result->content[i][i] = 1;
	}
	return *result;
}

bool esCompatible(const Matrix& m, const Matrix& n) {
	return ((m.cols == n.cols) && (m.rows == n.rows));
}
