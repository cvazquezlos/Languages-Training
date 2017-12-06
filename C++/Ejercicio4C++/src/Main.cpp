#include "Matriz.h"
#include <iostream>
int main(){
	std::cout <<"MATRIZ 1 "<<endl;
	Matriz m1 (2,2);
	std::cout <<"MATRIZ 2 "<<endl;
	Matriz m2 (2,2);
	Matriz m3;
	m3 = m1 + m2;
	std::cout <<"SUMA MATRIZ 1 Y 2 "<<endl;
	std::cout<<m3;
	m1.with(0,0,4).with(1,1,-6);
	std::cout<<m1;
	m1+=(Matriz::getIdentityMatriz(2));
	std::cout<<m1;
	if ((m1)!=(m2)){
		std::cout<<"diferentes";
	}
}
