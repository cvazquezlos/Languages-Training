module Examenes where

import Data.Char

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
------------------------- EXAMEN 31 DE OCTUBRE DE 2014 -------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------- EJERCICIO 2 ----------------------------------
pertenece:: (Eq a)=>a->[a]->Bool
pertenece n x = foldr (\m acum->if (m==n) then True else acum) False x

eliminar:: (Eq a)=>a->[a]->[a]
eliminar n x = foldl (\acum m->if (m==n) then acum else acum++[m]) [] x 

--------------------------------- EJERCICIO 3 ----------------------------------
type Identificador = Int
type Capacidad = Int

data Mesa = Mesa {id:: Identificador, capacidad:: Capacidad}

type Libres = [Mesa]
type Ocupadas = [Mesa]

data Ocupacion = Ocupacion {libres:: Libres, ocupadas:: Ocupadas}

instance Show Ocupacion where
	show (Ocupacion x y) = "Libres:\n" ++ show x ++
						"\nOcupadas:\n" ++ show y
											
instance Show Mesa where
	show (Mesa id capacidad) = "Mesa " ++ show id ++ " -> Capacidad: " ++
								    show capacidad
	
instance Eq Mesa where
	(Mesa id1 capacidad1) == (Mesa id2 capacidad2) = 
					      (id1 == id2) && (capacidad1==capacidad2)	

instance Ord Mesa where
	(Mesa _ capacidad1) < (Mesa _ capacidad2) = capacidad1 < capacidad2
	(Mesa _ capacidad1) > (Mesa _ capacidad2) = capacidad1 > capacidad2
	(Mesa _ capacidad1) <= (Mesa _ capacidad2) = capacidad1 <= capacidad2
	(Mesa _ capacidad1) >= (Mesa _ capacidad2) = capacidad1 >= capacidad2
	
insertarMesaLibre:: Ocupacion->Mesa->Ocupacion
insertarMesaLibre (Ocupacion x y) m = (Ocupacion (insertarOrdenado m x) y)

insertarOrdenado:: Mesa->[Mesa]->[Mesa]
insertarOrdenado m [] = [m]
insertarOrdenado m (x:xs) = if (m < x) then m:x:xs
				       else x:insertarOrdenado m xs
									   
ocuparMesa:: Ocupacion->Int->Ocupacion
ocuparMesa (Ocupacion x y) n = mesaLibre x y n

mesaLibre:: [Mesa]->[Mesa]->Int->Ocupacion
mesaLibre [] y n = Ocupacion [] y
mesaLibre (x:xs) y n
		    | (capacidad x >= n) = (Ocupacion xs (insertarOrdenado x y))
		    | otherwise = Ocupacion (x:libres (mesaLibre xs y n)) 
						(ocupadas (mesaLibre xs y n))

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-------------------------- EXAMEN 30 DE JUNIO DE 2015 --------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------- EJERCICIO 2 ----------------------------------
type Title = String
type Abstract = String
type Day = Int
type Month = Int
type Year = Int

data Date = D Day Month Year deriving Show
data Article = Art Title Date Abstract deriving Show

-- Funciones para comparar fechas
equal:: Date->Date->Bool
equal (D d1 m1 y1) (D d2 m2 y2) = (d1==d2)&&(m1==m2)&&(y1==y2)

lessThan:: Date->Date->Bool
lessThan (D d1 m1 y1) (D d2 m2 y2) = (y1<y2)||((y1==y2)&&(m1<m2))
				     ||((y1==y2)&&(m1==m2)&&(d1<d2))
									 
greaterThan:: Date->Date->Bool
greaterThan date1 date2 = not (equal date1 date2) && not (lessThan date1 date2)

-- Funciones de ordenación de listas
mitades:: [a]->([a],[a])
mitades xs = splitAt (length xs`div`2) xs

mezcla:: (Ord a)=>[a]->[a]->[a]
mezcla [] ys = ys
mezcla xs [] = xs
mezcla (x:xs) (y:ys)
		    | (x<=y) = x:(mezcla xs (y:ys))
		    | otherwise = y:(mezcla (x:xs) ys)
					
ordMezcla:: (Ord a)=>[a]->[a]
ordMezcla [] = []
ordMezcla [x] = [x]
ordMezcla xs = mezcla (ordMezcla ys) (ordMezcla zs)
	          where
	             (ys,zs) = mitades xs
			         
-- Declaración de datos concretos
date1:: Date
date1 = D 16 06 2015

date2:: Date
date2 = D 10 05 2015

date3:: Date
date3 = D 09 01 2014

date4:: Date
date4 = D 10 05 2015

article1 = Art "Pope Francis Calls for Climate Action in Draft of Enclynical"
              date1 "Pope Francis offers a broad vision of..."
		      
article2 = Art "Discontent in Eastern Ukraine Leads to Rare Public Protest"
	      date2 "Residents of two frequently shelled..."
		     
article3 = Art "Hong Kong Police Arrest 9 Ahead of Contentious Vote"
	      date3 "The Hong Kong police said on Monday that..."
			  
article4 = Art "DnA Deciphers Roots of Modern Europeans"
	      date4 "For centuries, archaeologists have..."
		     
articlesList = [article1,article2,article3,article4]

-- Esta es la solución. Lo anterior lo daba Alfonso en el enunciado del examen.
instance Eq Article where
	(Art _ date1 _) == (Art _ date2 _) = equal date1 date2
	
instance Ord Article where
	(Art _ date1 _) < (Art _ date2 _) = lessThan date1 date2
	(Art _ date1 _) > (Art _ date2 _) = greaterThan date1 date2
	(Art _ date1 _) <= (Art _ date2 _) = not (greaterThan date1 date2)
	(Art _ date1 _) >= (Art _ date2 _) = not (lessThan date1 date2)
	
--------------------------------- EJERCICIO 3 ----------------------------------
sumaVectores:: [Int]->[Int]->Int
sumaVectores x y = foldr (+) 0 [u*v|(u,v)<-(zip x y)] 

--------------------------------- EJERCICIO 4 ----------------------------------
{-
La primera función elimina todos los valores de una lista a partir de n. Si n
vale 2 y la lista es, por ejemplo, [a,b,c,d,e,f], la función devuelve [a,b].
Coge los n primeros elementos. En el caso de que la lista sea menor que el valor
de n, devuelve la lista. 

La declaración de la segunda función debería ser:
	
	get [a]->Int->a
-}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
------------------------ EXAMEN 02 DE NOVIEMBRE DE 2015 ------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------- EJERCICIO 2 ----------------------------------
filter':: (a->Bool)->[a]->[a]
filter' f x = foldl (\acum m->if(f m) then acum++[m] else acum) [] x

mmap:: [(b->b)]->[b]->[b]
mmap x y = mmapAux x y []

mmapAux:: [(b->b)]->[b]->[b]->[b]
mmapAux [] x acum = x
mmapAux (f:fs) [] acum = mmapAux fs acum [] 
mmapAux (x:xs) (y:ys) acum = mmapAux (x:xs) ys (acum++[x y])

--------------------------------- EJERCICIO 3 ----------------------------------
iguales':: (Eq a)=>[a]->[[a]]
iguales' x = iguales'Aux x [] [[]]

iguales'Aux:: (Eq a)=>[a]->[a]->[[a]]->[[a]]
iguales'Aux [] _ acum = acum
iguales'Aux (x:xs) acum1 acum = if (repetido x acum1) 
			          then iguales'Aux xs acum1 (inserta x acum)
				  else iguales'Aux xs (acum1++[x]) (acum++[[x]])

repetido:: (Eq a)=>a->[a]->Bool
repetido _ [] = False
repetido n (x:xs)
		 | (n==x) = True
		 | otherwise = repetido n xs
				 
inserta:: (Eq a)=>a->[[a]]->[[a]]
inserta _ [[]] = [[]]
inserta x (u:ys)
		| (repetido x u) = (ys++[u++[x]])
		| otherwise = (inserta x ys)++[u]
					 
--------------------------------- EJERCICIO 4 ----------------------------------
type PrecioBase = Float

data IVA = Musica | Libros
data Producto = Producto {precio:: PrecioBase, iva:: IVA}

getPrecio:: Producto->Float
getPrecio (Producto precio _) = precio

getTasa:: Producto->Float
getTasa (Producto _ Musica) = 0.21
getTasaa (Producto _ Libros) = 0.15

getImpuesto:: Producto->IVA
getImpuesto (Producto _ iva) = iva

pvp:: Producto->Float
pvp x = (getPrecio x)*(getTasa x)

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-------------------------- EXAMEN 28 DE JUNIO DE 2016 --------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------- EJERCICIO 2 ----------------------------------
ej2:: String->(String, String)
ej2 x = foldl (\(a1,a2) n->if (repetido' n "aeiouAEIOU") then (a1++[n],a2) 
						    else (a1,a2++[n])) ("","") x

repetido':: Char->String->Bool
repetido' _ [] = False
repetido' x (y:ys) = if (x==y) then True else repetido' x ys

--------------------------------- EJERCICIO 3 ----------------------------------
class Joinable a where
    union:: a->a->a
	
instance Joinable [a] where
    union [a] [b] = concat [[a],[b]]
	
data Arbol a = AV | Rama (Arbol a) a (Arbol a) deriving Show

instance Joinable (Arbol a) where
    union (Rama i1 r1 d1) (Rama i2 r2 d2) = unir (Rama i1 r1 d1) (Rama i2 r2 d2)
	
unir:: Arbol a->Arbol a->Arbol a
unir (Rama AV raiz der) b = Rama b raiz der
unir (Rama izq raiz der) b = Rama (unir izq b) raiz der

--------------------------------- EJERCICIO 4 ----------------------------------
fold':: (b->a->b)->b->[a]->[[b]]
fold' f n x = fold'' f n x (subsecs x)

fold'':: (b->a->b)->b->[a]->[[a]]->[[b]]
fold'' f _ [] _ = []
fold'' f n (x:xs) (y:ys) = [fold'Aux f n y]:(fold'' f n xs ys)

fold'Aux:: (b->a->b)->b->[a]->b
fold'Aux f n x = foldl (f) n x

subsecs:: [a]->[[a]]
subsecs x = subsecsAux x []

subsecsAux:: [a]->[a]->[[a]]
subsecsAux [] _ = []
subsecsAux (x:xs) acum = y:(subsecsAux xs y)
		            where
			       y = acum++[x]

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
------------------------- EXAMEN 28 DE OCTUBRE DE 2016 -------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------- EJERCICIO 2 ----------------------------------
sustituir:: (Eq a)=>[a]->a->a->[a]
sustituir x u v = foldr (\n acum->if ((odd ((length acum)+1))&&(n==u)) 
				     then (v:acum)
				     else (n:acum)) [] x

cambio:: String->String
cambio x = foldr (\m acum->if (isUpper m) then (acum++[toLower m])
					  else (acum++[toUpper m])) [] x
										  
--------------------------------- EJERCICIO 3 ----------------------------------
type Nombre = Int
type Version = Float

getMV:: Version->Int
getMV x = truncate x

getmV:: Version->Int
getmV x = truncate ((x - (fromInteger (truncate x)))*100)

data Libreria = Libreria {nombre:: Nombre, version:: Version}

instance Eq Libreria where
    (Libreria n1 v1) == (Libreria n2 v2) = (n1==n2)&&(v1==v2)
    libreria1 /= libreria2 = not (libreria1==libreria2)
	
instance Ord Libreria where
    (Libreria n1 v1) < (Libreria n2 v2) = (n1<n2) || ((n1==n2)&&(v1<v2))
    (Libreria n1 v1) > (Libreria n2 v2) = (n1>n2) || ((n1==n2)&&(v1>v2))
    (Libreria n1 v1) <= (Libreria n2 v2) = (n1<=n2) || ((n1==n2)&&(v1<=v2))
    (Libreria n1 v1) >= (Libreria n2 v2) = (n1>=n2) || ((n1==n2)&&(v1>=v2))

class Compatible a where
    esCompatible:: a->a->Bool

instance Compatible Libreria where
    esCompatible (Libreria n1 v1) (Libreria n2 v2) = (n1==n2) && (v1<=v2)
	
devuelveCompatibles:: [Libreria]->Libreria->[Libreria]
devuelveCompatibles [] _ = []
devuelveCompatibles (x:xs) u = if (esCompatible x u) then x:y
				     else y 
			          where
				     y = devuelveCompatibles xs u

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-------------------------- EXAMEN 27 DE JUNIO DE 2017 --------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------- EJERCICIO 2 ----------------------------------
separacion:: (Eq a)=>[a]->[[a]]
separacion x = foldl (\[acum1,acum2] n->if (repetido'' n x 1)
					  then (
					     if (repetido'' n acum2 0) then (
					        [acum1,acum2]
					     ) else (
						[acum1,acum2++[n]]
					     )
					  ) else ([acum1++[n],acum2])) [[],[]] x

repetido'':: (Eq a)=>a->[a]->Int->Bool
repetido'' n x z = length [y|y<-x, y==n] > z

cuantasPitagoricas:: [(Int,Int,Int)]->Int
cuantasPitagoricas x = length [(a,b,c)|(a,b,c)<-x, (c^2)==((a^2)+(b^2))]

--------------------------------- EJERCICIO 3 ----------------------------------
type Timestamp = Int
type Fichero = String
type Funcion = String
type Mensaje = String

data Log = Linea Timestamp Fichero Funcion Mensaje 
		      | Multilinea Timestamp Fichero Funcion [Mensaje]
		      
instance Eq Log where
    Linea _ _ _ _ == Multilinea _ _ _ _ = False
    1Linea t1 f1 ff1 m1 == Linea t2 f2 ff2 m2 = (t1==t2) && (f1==f2) && 
						(ff1==ff2) && (m1==m2)
	Multilinea t1 f1 ff1 m1 == Multilinea t2 f2 ff2 m2 = (t1==t2) && (f1==f2) && 
						(ff1==ff2) && (m1==m2)
						   
instance Ord Log where
	(Linea t1 _ _ _) < (Linea t2 _ _ _) = (t1<t2)
	(Linea t1 _ _ _) > (Linea t2 _ _ _) = (t1>t2)
	(Linea t1 _ _ _) <= (Linea t2 _ _ _) = (t1<=t2)
	(Linea t1 _ _ _) >= (Linea t2 _ _ _) = (t1>=t2)
