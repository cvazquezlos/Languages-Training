/*
 * Cell.h
 *
 *  Created on: 7/12/2017
 *      Author: cvazquel
 */

#ifndef CELL_H_
#define CELL_H_

#include <string>

class Cell {
public:
	Cell(int, int);
	virtual ~Cell();

	virtual Cell* createCopy()=0;
	virtual int getCellValueAsInt()=0;
	virtual double getCellValueAsDouble()=0;
	virtual std::string getCellValueAsString()=0;

protected:
	int getFila() const {return fila;};
	int getColumna() const {return columna;};
	void setFila(int f) {fila = f;};
	void setColumna(int c) {columna = c;};

private:
	int fila;
	int columna;
};

#endif /* CELL_H_ */
