/*
 * IntegerCell.h
 *
 *  Created on: 7/12/2017
 *      Author: cvazquel
 */

#ifndef INTEGERCELL_H_
#define INTEGERCELL_H_

#include "Cell.h"
#include <string>

class IntegerCell: public Cell {
public:
	IntegerCell(int, int, int);
	virtual ~IntegerCell();

	Cell* createCopy();
	int getCellValueAsInt();
	double getCellValueAsDouble();
	std::string getCellValueAsString();

private:
	int valor;
};

#endif /* INTEGERCELL_H_ */
