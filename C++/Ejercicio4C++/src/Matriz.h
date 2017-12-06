
#ifndef MATRIZ_H_
#define MATRIZ_H_
#include <iostream>

using namespace std;

class Matriz {
public:
	Matriz();
	virtual ~Matriz();
	Matriz(int r,int c);
	Matriz(const Matriz&);

	friend Matriz operator+(const Matriz&, const Matriz&);
	friend Matriz operator-(const Matriz&, const Matriz&);
	friend Matriz operator*(const Matriz&, const Matriz&);

	bool operator==(const Matriz&);
	Matriz& operator+=(const Matriz&);
	bool operator!=(const Matriz&);
	friend ostream& operator<<(ostream& o ,const Matriz&);

	bool esCompatible(const Matriz& m2)const; // Hace constante a toda la funcion
	bool esCompatibleMult(const Matriz& m2)const;
	Matriz& operator= (const Matriz&);
	int& operator()(int r,int c);
	const int& operator()(int r,int c) const; // Los parametros son constantes. El valor de retorno tambien
	// Devuelve una referencia a un entero
	static int contador;
	static Matriz getIdentityMatriz(int);
	Matriz& with(int r, int c, int v);
private:
	int col;
	int fila;
	int** datos; // datos apunta a una lista que apunta a otra lista (puntero a punteros)
};

#endif /* MATRIZ_H_ */
