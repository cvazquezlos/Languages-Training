/*
 * main.cpp
 *
 *  Created on: 8/12/2017
 *      Author: cvazquel
 */

#include "Sucesion.h"
#include "ProgAritmetica.h"
#include "ProgGeometrica.h"
#include <iostream>
#include <string>

using namespace std;

int main() {
	ProgAritmetica* a = new ProgAritmetica(1, 5, 2);
	cout << a->suma() << endl;
	cout << a->elementoN(3) << endl;

	ProgGeometrica* g = new ProgGeometrica(3, 10, 3);
	cout << g->suma() << endl;
	cout << g->elementoN(8) << endl;
}
