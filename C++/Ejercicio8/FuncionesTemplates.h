/*
 * FuncionesTemplates.h
 *
 *  Created on: 12/12/2017
 *      Author: cvazquel
 */

#ifndef FUNCIONESTEMPLATES_H_
#define FUNCIONESTEMPLATES_H_

#include <math.h>

class FuncionesTemplates {
public:
	FuncionesTemplates();
	virtual ~FuncionesTemplates();

	template <class T> T mayor2(const T& a, const T& b) {
		return (a>=b) ? a:b;
	}
	template <class T> T mayor3(const T& a, const T& b, const T& c) {
		if (a>=b && b>=c) {
			return a;
		} else if (b>=c && b>=a) {
			return b;
		} else {
			return c;
		}
	}
	template <class T> T potencia(const T& a, const T& b) {
		pow (a, b);
	}
};

#endif /* FUNCIONESTEMPLATES_H_ */

