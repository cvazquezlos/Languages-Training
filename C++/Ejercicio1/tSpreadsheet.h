/*
 * tSpreadsheet.h
 *
 *  Created on: 6/12/2017
 *      Author: cvazquel
 */

#ifndef TSPREADSHEET_H_
#define TSPREADSHEET_H_

#include <string>

typedef struct {
	unsigned int numRows;
	unsigned int numCols;
	int **content;
} tSpreadsheet;

tSpreadsheet *loadCsvFile(const std::string filename);
int saveCsvFile(tSpreadsheet* data, const std::string filename);
int sumRow(tSpreadsheet* data, unsigned int rowIndex);
int sumCol(tSpreadsheet* data, unsigned int colIndex);
int deleteData(tSpreadsheet* data);

#endif /* TSPREADSHEET_H_ */
