/*
 * Matrix.h
 *
 *  Created on: 12/12/2017
 *      Author: cvazquel
 */

#ifndef MATRIX_H_
#define MATRIX_H_

#include <iostream>
#include <string>

using namespace std;

template <class T>
class Matrix {
public:
	Matrix();                                                    // Constructor por defecto.
	Matrix(const Matrix<T>&);                                       // Constructor por copia.
	Matrix(int, int);                                            // Constructor dados el número de filas y columnas.
	Matrix(int, int, T**);
	Matrix(int, int, T);
	// Constructor dados el número de filas y de columnas y la matriz.
	virtual ~Matrix();                                           // Destructor.

	// Sobrecarga de operadores. Estas declaraciones nunca cambian.
	Matrix<T>& operator+(const Matrix<T>&) const;
	Matrix<T>& operator-(const Matrix<T>&) const;
	Matrix<T>& operator*(const Matrix<T>&) const;
	Matrix<T>& operator=(const Matrix<T>&);

	template <class U>
	friend ostream& operator<<(ostream&, const Matrix<U>&);

	bool operator==(const Matrix<T>&) const;
	bool operator!=(const Matrix<T>&) const;
    T& operator()(const unsigned int, const unsigned int) const;

    static Matrix<T>& getIdentityMatrix(const unsigned int);         // Método que devuelve una matriz identidad del rango dado.

private:
	unsigned int rows;
	unsigned int cols;
	T** content;

	template <class U>
	friend bool esCompatible(const Matrix<U>&, const Matrix<U>&);
};

#endif /* MATRIX_H_ */

template <class T>
Matrix<T>::Matrix(): rows(0), cols(0) {
	content = NULL;
}

// Constructor por copia.
template <class T>
Matrix<T>::Matrix(const Matrix<T>& m) {
	*this = m;
}

// Constructor dado un número de filas y columnas. La matriz se rellena por defecto con ceros.
template <class T>
Matrix<T>::Matrix(int r, int c, T d): rows(r), cols(c) {
	content = new T *[rows];
	for (unsigned int i=0; i<rows; i++) {
		content[i] = new T [cols];
		for (unsigned int j=0; j<cols; j++) {
			content[i][j] = d;
		}
	}
}

// Constructor dado un número de filas y de columnas, y dada una matriz.
template <class T>
Matrix<T>::Matrix(int r, int c, T** m): rows(r), cols(c) {
	content = new T *[rows];
	for (unsigned int i=0; i<rows; i++) {
		content[i] = new T [cols];
		for (unsigned int j=0; j<cols; j++) {
			content[i][j] = m[i][j];
		}
	}
}

// Destructor. Como este objeto hace uso de memoria dinámica, hay que eliminar su atributo manualmente.
template <class T>
Matrix<T>::~Matrix() {
	for (unsigned int i=0; i<rows; i++) {
		delete [] content[i];
	}
	delete [] content;
}

template <class T>
Matrix<T>& Matrix<T>::operator+(const Matrix<T>& m) const {
	Matrix<T>* result = new Matrix<T>(rows, cols);           // Creamos la matriz resultado (este constructor inicializa la matriz con ceros).
	if (esCompatible(*this, m)) {                      // Comprobamos si las dos matrices tienen la misma dimensión para poder suamrlas.
		for (unsigned int i=0; i<rows; i++) {          // Recorremos las i filas.
			for (unsigned int j=0; j<cols; j++) {      // Recorremos las columnas de la fila i.
				result->content[i][j] = content[i][j]  // Sumamos el elemento i,j de ambas matrices.
									+ m.content[i][j];
			}
		}
	}
	return *result;                                    // Devolvemos la matriz resultado.
}

template <class T>
Matrix<T>& Matrix<T>::operator-(const Matrix<T>& m) const {
	Matrix<T>* result = new Matrix<T>(rows, cols);           // Creamos la matriz resultado (este constructor inicializa la matriz con ceros).
	if (esCompatible(*this, m)) {                      // Comprobamos si las dos matrices tienen la misma dimensión para poder restarlas.
		for (unsigned int i=0; i<rows; i++) {          // Recorremos las i filas.
			for (unsigned int j=0; j<cols; j++) {      // Recorremos las columnas de la fila i.
				result->content[i][j] = content[i][j]  // Restamos el elemento i,j de la matriz implícita y la que entra como parámetro.
									- m.content[i][j];
			}
		}
	}
	return *result;                                    // Devolvemos la matriz resultado.
}

template <class T>
Matrix<T>& Matrix<T>::operator*(const Matrix<T>& m) const {
	Matrix* result = new Matrix<T>(rows, cols);           // Creamos la matriz resultado (este constructor inicializa la matriz con ceros).
	if (esCompatible(*this, m)) {                      // Comprobamos si las dos matrices tienen la misma dimensión para poder multiplicarlas.
		for (unsigned int i=0; i<rows; i++) {          // Recorremos las i filas de la primera matriz.
			for (unsigned int j=0; j<cols; j++) {      // Recorremos las j columnas de la segunda matriz.
				int r = 0;                             // Creamos un contador para almacenar el resultado de la multiplicación.
				for (unsigned int k=0; k<cols; k++) {  // Recorremos las k columnas de la i-ésima fila de la primera matriz.
					r = r + content[i][k]              // Incrementamos el contador con el valor adecuado.
						  * content[k][j];
				}
				result->content[i][j] = r;             // Almacenamos el contador.
			}
		}
	}
	return *result;                                    // Devolvemos la matriz resultado.
}

template <class T>
Matrix<T>& Matrix<T>::operator=(const Matrix<T>& m) {
	if (!esCompatible(*this, m)) {                     // Si no tienen la misma dimensión, entonces hay que borrar la antigua matriz.
		for (unsigned int i=0; i<rows; i++) {          // Esta forma de borrar matrices siempre es idéntica.
			delete [] content[i];
		}
		delete [] content;
		rows = m.rows;                                 // Una vez hemos borrado la matriz, almacenamos el nuevo valor de las filas.
		cols = m.cols;                                 // También almacenamos el nuevo valor de las columnas.
		content = new int *[rows];                     // Primero, definimos nuestra matriz como una lista de punteros (filas).
		for (unsigned int i=0; i<rows; i++) {          // Para cada una de las filas i
			content[i] = new int[cols];                // Apuntamos el puntero a una lista de columnas.
		}
	}
	for (unsigned int i=0; i<rows; i++) {              // Recorremos cada fila de la matriz.
		for (unsigned int j=0; j<cols; j++) {          // Recorremos las columnas de la fila i.
			content[i][j] = m.content[i][j];           // Actualizamos el valor por el nuevo valor de m.
		}
	}
	return *this;                                      // Devolvemos el objeto modificado.
}

// La sobrecarga de este operador permite mostrarlo por pantalla fácilmente.
template <class T>
ostream& operator<<(ostream& o, const Matrix<T>& m){
	o << "[";                                          // La matriz comienza con un corchete.
	for (unsigned int i=0; i<m.rows; i++){             // Recorremos las filas de la matriz que queremos imprimir (el método es friend).
		o << " [";                                     // Cada fila comienza con un corchete.
		for(unsigned int j=0; j<m.cols; j++){          // Recorremos las columnas de la matriz.
			cout << m.content[i][j] << " ";            // Se imprime su valor seguido de un espacio en blanco.
		}
		o << "]";                                      // Cada fila acaba con un corchete.
	}
	o << " ]" << endl;                                 // Imprimimos el corchete que cierra la matriz con un salto de línea.
	return o;
}

template <class T>
bool Matrix<T>::operator==(const Matrix<T>& m) const {
	if (esCompatible(*this, m)) {                      // Si tienen igual dimensión entonces continuamos, si no, nunca serán iguales.
		for (unsigned int i=0; i<rows; i++) {          // Recorremos las filas de las matrices.
			for (unsigned int j=0; j<cols; j++) {      // También sus columnas.
				if (content[i][j]!=m.content[i][j]) {  // Si algún valor difiere al iterar por él, la ejecución termina devolviendo un false.
					return false;
				}
			}
		}
		return true;                                   // Si los dos bucles terminan sin encontrar diferencias, devolvemos un true.
	} else {
		return false;
	}
}

template <class T>
bool Matrix<T>::operator!=(const Matrix<T>& m) const {       // La sobrecarga del operator == nos permite implementar este operator tan fácilmente.
	return !(*this == m);
}

template <class T>
T& Matrix<T>::operator()(const unsigned int r, const unsigned int c) const {
	return content[r][c];
}

template <class T>
Matrix<T>& Matrix<T>::getIdentityMatrix(const unsigned int size) {
	Matrix<T>* result = new Matrix<T>(size, size);            // Usamos el constructor para declarar la matriz cuadrada resultado.
	for (unsigned int i=0; i<result->rows; i++) {       // Recorremos cada fila.
		result->content[i][i] = 1;                      // Ya que queremos una matriz identidad, recorriendo solo las filas podemos acceder a su
	}                                                   // diagonal principal y completarla con unos.
	return *result;                                     // Devolvemos la matriz identidad.
}

template <class T>
bool esCompatible(const Matrix<T>& m, const Matrix<T>& n) {
	return ((m.cols == n.cols) && (m.rows == n.rows));
}
