/*
 * Matrix.h
 *
 *  Created on: 7/12/2017
 *      Author: cvazquel
 */

#ifndef MATRIX_H_
#define MATRIX_H_
#include <iostream>
#include <string>

class Matrix {
public:
	Matrix();
	Matrix(const Matrix&); // Constructor por copia
	Matrix(int, int);
	Matrix(int, int, int**);
	virtual ~Matrix();

	Matrix& operator+(const Matrix&) const;
	Matrix& operator-(const Matrix&) const;
	Matrix& operator*(const Matrix&) const;
	Matrix& operator=(const Matrix&);

	friend std::ostream& operator<<(std::ostream&, const Matrix&);

	bool operator==(const Matrix&) const;
	bool operator!=(const Matrix&) const;
    int operator()(const unsigned int, const unsigned int) const;

    static Matrix& getIdentityMatrix(const unsigned int);

private:
	unsigned int rows;
	unsigned int cols;
	int** content;

	friend bool esCompatible(const Matrix&, const Matrix&);
};

#endif /* MATRIX_H_ */
