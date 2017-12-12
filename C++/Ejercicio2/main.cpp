/*
 * main.cpp
 *
 *  Created on: 6/12/2017
 *      Author: cvazquel
 */

#include "Complex.h"
#include <iostream>

using namespace std;

int main() {
	Complex* c1 = new Complex(1, 2);
	Complex* c2 = new Complex(*c1);
	Complex* c3 = new Complex(6, 8);

	cout << *c1 << endl;
	cout << (*c1==*c2) << endl;
	cout << (*c3==*c2) << endl;

	Complex c4 = *c1 + *c2;
	cout << c4 << endl;

	cout << c1->abs() << endl;
}
