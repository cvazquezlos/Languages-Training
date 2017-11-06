module BinaryThree where

data Arbol a = AV | Rama (Arbol a) a (Arbol a)

-- A. Calcular el número de hojas de un árbol.
ejA:: Arbol a->Int
ejA (Rama AV n AV) = 1
ejA (Rama izq raiz der) = (ejA izq) + (ejA der)

-- B. Mostrar las hojas de un árbol.
ejB:: Arbol a->[a]
ejB (Rama AV n AV) = [n]
ejB (Rama izq raiz der) = (ejB izq) ++ (ejB der)

-- C. Calcular el número de nodos de un árbol.
ejC:: Arbol a->Int
ejC (Rama AV n AV) = 0
ejC (Rama izq raiz der) = (ejC izq) + 1 + (ejC der)

-- D. Mostrar los nodos de un árbol.
ejD:: Arbol a->[a]
ejD (Rama AV n AV) = []
ejD (Rama izq raiz der) = (ejD izq) ++ [raiz] ++ (ejD der)

-- E. Calcular la profundidad de un árbol.
ejE:: Arbol a->Int
ejE (Rama AV n AV) = 0
ejE (Rama izq raiz der) = 1 + max (ejE izq) (ejE der)

-- F. Calcular la lista correspondiente al recorrido preorden del árbol.
-- El recorrido preorden visita primero la raíz del árbol, a continuación
-- el subárbol izquierdo, y, finalmente, el subárbol derecho.
ejF:: Arbol a->[a]
ejF (Rama AV n AV) = [n]
ejF (Rama izq raiz der) = [raiz] ++ (ejF izq) ++ (ejF der)

-- G. Calcular la lista correspondiente al recorrido postorden del árbol.
-- El recorrido postorden visita primero el subárbol izquierdo, a continuación
-- el subárbol derecho y, finalmente, la raíz.
ejG:: Arbol a->[a]
ejG (Rama AV n AV) = [n]
ejG (Rama izq raiz der) = (ejG izq) ++ (ejG der) ++ [raiz]

-- H. Calcular la lista correspondiente al recorrido inorden del árbol.
-- El recorrido inorden visita primero el subárbol izquierdo, a continuación
-- la raíz, y, finalmente, el subárbol derecho.
ejH:: Arbol a->[a]
ejH (Rama AV n AV) = [n]
ejH (Rama izq raiz der) = (ejH izq) ++ [raiz] ++ (ejH der)

-- I. 
