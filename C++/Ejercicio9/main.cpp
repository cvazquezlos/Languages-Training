/*
 * main.cpp
 *
 *  Created on: 13/12/2017
 *      Author: cvazquel
 */

#include "Matrix.h"
#include <string>

using namespace std;

int main() {
	Matrix<char>* m1 = new Matrix<char>(2, 3, 'j');
	cout << *m1 << endl;

	return 0;
}
