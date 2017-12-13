/*
 * main.cpp
 *
 *  Created on: 12/12/2017
 *      Author: cvazquel
 */

#include "FuncionesTemplates.h"

#include <iostream>
#include <string>

using namespace std;

int main() {
	FuncionesTemplates* ft = new FuncionesTemplates;
	cout << ft->mayor2(2, 3) << endl;
	cout << ft->mayor3(6, 7, 8) << endl;
	cout << ft->mayor2('h', 'i') << endl;
	cout << ft->mayor3('a', 'b', 'c') << endl;
}
