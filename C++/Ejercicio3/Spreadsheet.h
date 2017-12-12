/*
 * Spreadsheet.h
 *
 *  Created on: 6/12/2017
 *      Author: cvazquel
 */

#ifndef SPREADSHEET_H_
#define SPREADSHEET_H_

#include <string>

class Spreadsheet {
public:
	Spreadsheet();
	Spreadsheet(unsigned int r, unsigned int c, int d=0){
		initialize(r, c, d); // Cuando hay parámetros por defecto, el constructor hay que hacerlo así.
	};
	Spreadsheet(const Spreadsheet&);
	virtual ~Spreadsheet();

	unsigned int getRows() const;
	unsigned int getCols() const;
	int sumRow(unsigned int rowIndex) const;

	bool loadCsvFile(std::string filename);
	bool saveCsvFile(std::string filename) const;

	Spreadsheet& width(int, int, int);

private:
	unsigned int rows;
	unsigned int cols;
	int **content;

	void initialize(unsigned int, unsigned int, int);
};

#endif /* SPREADSHEET_H_ */
