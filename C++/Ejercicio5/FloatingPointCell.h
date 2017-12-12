/*
 * FloatingPointCell.h
 *
 *  Created on: 7/12/2017
 *      Author: cvazquel
 */

#ifndef FLOATINGPOINTCELL_H_
#define FLOATINGPOINTCELL_H_

#include "Cell.h"

class FloatingPointCell: public Cell {
public:
	FloatingPointCell(int, int, double);
	virtual ~FloatingPointCell();

	Cell* createCopy();
	int getCellValueAsInt();
	double getCellValueAsDouble();
	std::string getCellValueAsString();

private:
	double valor;
};

#endif /* FLOATINGPOINTCELL_H_ */
