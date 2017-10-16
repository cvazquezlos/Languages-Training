module Lists where

-- A. Given a list, return its elements until the first zero.
ejA:: [Int] -> [Int] -- Primitive recursion.
ejA [] = []
ejA (x:xs) = if (x /= 0) then x:(ejA xs) else []

ejA':: [Int] -> [Int] -- Tail recursion
ejA' x = ejA'Aux x []

ejA'Aux:: [Int] -> [Int] -> [Int]
ejA'Aux [] acum = acum
ejA'Aux (x:xs) acum = if (x /= 0) then (x:acum) ++ (ejA'Aux xs acum) else acum

-- B. Given a list, return its sublists between each zero it has.
ejB:: [Int] -> [[Int]]
ejB x = ejBAux x [] []

ejBAux:: [Int] -> [Int] -> [[Int]] -> [[Int]]
ejBAux [] acum1 acum2 = acum2++[acum1]
ejBAux (x:xs) acum1 acum2 = if (x==0) then ejBAux xs [] (acum2++[acum1])
									  else ejBAux xs (acum1++[x]) acum2
								
-- C. Given a list, return its sequences of elements.
ejC:: [a] -> [[a]]
ejC x = ejC (init x) ++ [x]

-- D. Given a list, return the same list with its elements multiplied by 2.
ejD:: [Int] -> [Int] -- Primitive recursion.
ejD [] = []
ejD (x:xs) = (doble x):(ejD xs)

ejD':: [Int] -> [Int] -- Tail recursion.
ejD' x = ejD'Aux x []

ejD'Aux:: [Int] -> [Int] -> [Int]
ejD'Aux [] acum = acum
ejD'Aux (x:xs) acum = (doble x):acum ++ (ejD'Aux xs acum)

ejD'':: [Int] -> [Int] -- Map function.
ejD'' x = map doble x

ejD''':: [Int] -> [Int] -- Superior order functions.
ejD''' x = foldr (\n acum -> (doble n):acum) [] x

ejD'''':: [Int] -> [Int] -- Superior order + map.
ejD'''' x = foldr (\n acum -> n:acum) [] (map doble x)

doble:: Int -> Int
doble = (\x -> x*2)
