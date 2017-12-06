/*
 * main.cpp
 *
 *  Created on: 1/12/2017
 *      Author: guillermourbano
 */

#include <iostream>
#include "Complejo.h"

using namespace std;

int main(void){
	Complejo c1 (8,7);
	Complejo* c2 = new Complejo(-5,7);
	Complejo* c3 = new Complejo();
	*c3=c1 + *c2;
	cout<< *c3 <<endl;
}


