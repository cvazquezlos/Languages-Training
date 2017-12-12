/*
 * main.cpp
 *
 *  Created on: 8/12/2017
 *      Author: cvazquel
 */

#include "Figura.h"
#include "Circulo.h"
#include "Cuadrado.h"
#include "Elipse.h"
#include "Rectangulo.h"

#include <iostream>
#include <string>

using namespace std;

int main() {
	bool seguir = true;
	cout << "Selecciona figuras introduciendo el número adecuado o";
	cout << " introduce -1 para finalizar." << endl;
	int figura;
	string color;
	while (seguir) {
		cout << "Selecciona una figura: Circulo (0), Cuadrado (1),";
		cout << " Elipse (2), Rectangulo (3): ";
		cin >> figura;
		cout << endl << "Seleccione un color: ";
		cin >> color;
		cout << endl;
		switch (figura) {
		case 0:
		{
			cout << "Has seleccionado el circulo. Introduce su radio: ";
			double radio;
			cin >> radio;
			cout << endl;
			Circulo* c;
			c = new Circulo(color, radio);
			Figura* f = c;
			f->mostrar();
		}
		break;
		case 1:
		{
			cout << "Has seleccionado el cuadrado. Introduce su lado: ";
			double lado;
			cin >> lado;
			cout << endl;
			Cuadrado* c;
			c = new Cuadrado(color, lado);
			Figura* f = c;
			f->mostrar();
		}
		break;
		case 2:
		{
			cout << "Has seleccionado la elipse. Introduce su semieje mayor: ";
			double semiejeM;
			cin >> semiejeM;
			cout << endl << "Ahora introduce su semieje menor: ";
			double semiejem;
			cin >> semiejem;
			cout << endl;
			Elipse* e;
			e = new Elipse(color, semiejeM, semiejem);
			Figura* f = e;
			f->mostrar();
		}
		break;
		case 3:
		{
			cout << "Has seleccionado el rectangulo. Introduce su base: ";
			double base;
			cin >> base;
			cout << endl << "Ahora introduce su altura: ";
			double altura;
			cin >> altura;
			cout << endl;
			Rectangulo* r;
			r = new Rectangulo(color, base, altura);
			Figura* f = r;
			f->mostrar();
		}
		break;
		case -1:
			seguir = false;
			break;
		default:
			cout << "Figura inválida." << endl;
			break;
		}
	}
}
