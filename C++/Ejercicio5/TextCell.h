/*
 * TextCell.h
 *
 *  Created on: 7/12/2017
 *      Author: cvazquel
 */

#ifndef TEXTCELL_H_
#define TEXTCELL_H_

#include "Cell.h"
#include <string>

class TextCell: public Cell {
public:
	TextCell(int, int, std::string);
	virtual ~TextCell();

	Cell* createCopy();
	int getCellValueAsInt();
	double getCellValueAsDouble();
	std::string getCellValueAsString();

private:
	std::string valor;
};

#endif /* TEXTCELL_H_ */
