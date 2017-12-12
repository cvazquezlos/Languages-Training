/*
 * main.cpp
 *
 *  Created on: 7/12/2017
 *      Author: cvazquel
 */

#include "Matrix.h"
#include <algorithm>
#include <cstdlib>
#include <iostream>
#include <string>

using namespace std;

int main() {
	Matrix* m1 = new Matrix(2, 3);
	cout << *m1 << endl;

	int** matrix;
	matrix = new int *[2];
	for (int i=0; i<2; i++) {
		matrix[i] = new int [3];
		for (int j=0; j<3; j++) {
			matrix[i][j] = rand() % 100;
		}
	}
	Matrix* m2 = new Matrix(2, 3, matrix);
	cout << *m2 << endl;

	Matrix* m3 = new Matrix();
	*m3 = *m1 + *m2;
	cout << *m3 << endl;

	Matrix m4;
	m4 = Matrix::getIdentityMatrix(5);
}
