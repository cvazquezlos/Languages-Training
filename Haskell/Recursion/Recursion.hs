module Recursion where

-- This file contains exercises about recursion and lambda expressions.
-- Primitive recursion = Recursividad no final.
-- Tail recursion = Recursividad final.

-- A. Given a list, delete from it those numbers that are multiple of one given.
ejA:: [Int] -> Int -> [Int] -- List comprehension.
ejA x n = [y | y <- x, not (y `mod` 2 == 0)]

ejA':: [Int] -> Int -> [Int] -- Primitive recursion.
ejA' [] _ = []
ejA' (x:xs) n = if (x `mod` n == 0) then ejA' xs n else x:(ejA' xs n)

ejA'':: [Int] -> Int -> [Int] -- Tail recursion.
ejA'' x n = ejA''Aux x n []

ejA''Aux:: [Int] -> Int -> [Int] -> [Int]
ejA''Aux [] _ acum = acum
ejA''Aux (x:xs) n acum = if (x `mod` n == 0) then ejA''Aux xs n acum else ejA''Aux xs n (x:acum)

-- B. Write doble function just with lambda expressions.
ejB:: Int -> Int
ejB = (\ x -> x * x)

-- C. Given a list, return the multiplication of its numbers.
ejC:: [Int] -> Int -- Primitive recursion.
ejC [] = 0
ejC (x:xs) = (ejB x) + (ejC xs)

ejC':: [Int] -> Int -- Tail recursion.
ejC' x = ejC'Aux x 0

ejC'Aux:: [Int] -> Int -> Int
ejC'Aux [] acum = acum
ejC'Aux (x:xs) acum = acum + (ejB x) + (ejC'Aux xs acum)

ejC'':: [Int] -> Int -- Superior order functions.
ejC'' x = foldr (+) 0 (map (\m -> m* 2) x)

-- D. Given a list, return the average of its even numbers.
ejD:: [Int] -> Int -- Superior order functions.
ejD x = foldl (+) 0 (map (\m -> m * m) ([y | y <- x, even y]))

ejD':: [Int] -> Int -- List comprehension.
ejD' x = foldr (+) 0 [y * y | y <- x, y `mod` 2 == 0]

-- E. Given a list, return a 2-tuple which contains the element and its position in the list.
ejE:: [Int] -> [(Int, Int)]
ejE x = zip x [y | y <- [0..((length x) - 1)]]

-- F. Given a list, return the number of 0 inside of it.
ejF:: [Int] -> Int -- Primitive recursion
ejF [] = 0
ejF (x:xs) = if (x == 0) then 1 + ejF xs else 0 + ejF xs

ejF':: [Int] -> Int -- Tail recursion
ejF' x = ejF'Aux x 0

ejF'Aux:: [Int] -> Int -> Int
ejF'Aux [] acum = acum
ejF'Aux (x:xs) acum = if (x == 0) then acum + 1 + (ejF'Aux xs acum) 
								  else acum + (ejF'Aux xs acum)
                                  
ejF'':: [Int] -> Int -- List comprehension.
ejF'' x = length [y | y <- x, y == 0]

-- G. Given a list, return two lists: the first with the repeated numbers, the last one with the others.
ejG:: [Int] -> ([Int], [Int])
ejG x = ejGAux x [] []

ejGAux:: [Int] -> [Int] -> [Int] -> ([Int], [Int])
ejGAux [] acum1 acum2 = (acum1, acum2)
ejGAux (x:xs) acum1 acum2 = if repeated acum1 x then (
								ejGAux xs acum1 acum2
							) else (
								if repeated xs x then (
									ejGAux xs (acum1 ++ [x]) acum2
								) else ejGAux xs acum1 (acum2 ++ [x])
							)

repeated:: [Int] -> Int -> Bool
repeated [] _ = False
repeated (x:xs) n = if (x == n) then True else repeated xs n

-- H. Given a list, return the n higher numbers.
ejH:: [Int] -> Int -> [Int]
ejH x n = ejHAux x n []

ejHAux:: [Int] -> Int -> [Int] -> [Int]
ejHAux [] _ acum = acum
ejHAux _ 0 acum = acum
ejHAux x n acum = ejHAux (dropFromList x f) (n - 1) (acum ++ [x!!f])
					 where 
						f = maxElement x (x!!0) 0

maxElement:: [Int] -> Int -> Int -> Int
maxElement [] _ acum2 = acum2
maxElement (x:xs) acum1 acum2 = if (acum1 >= x) then maxElement xs acum1 acum2
											  	else maxElement xs x (acum2 + 1)
											  	  
dropFromList:: [Int] -> Int -> [Int]
dropFromList x n = if (n == 0) then drop 1 x else (take n x) ++ (drop (n + 1) x)