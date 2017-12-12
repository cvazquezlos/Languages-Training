/*
 * Complex.h
 *
 *  Created on: 6/12/2017
 *      Author: cvazquel
 */

#ifndef COMPLEX_H_
#define COMPLEX_H_
#include <iostream>
#include <string>

class Complex {
public:
	Complex();
	Complex(int, int);
	Complex(const Complex&);
	virtual ~Complex();

	double abs() const;

	bool operator==(const Complex& c) const;
	Complex& operator+(const Complex& c) const;
	friend std::ostream& operator<<(std::ostream&, const Complex& c);

private:
	int imag;
	int real;
};

#endif /* COMPLEX_H_ */
