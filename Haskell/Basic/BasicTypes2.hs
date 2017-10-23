
module BasicTypes2 where

-- A. Given three numbers, return their main.
ejA:: Float -> Float -> Float -> Float
ejA x y z = (x + y + z) / 3.0

-- B. Given different eur values, return the amount.
ejB:: Int -> Int -> Int -> Int -> Int -> Int
ejB v w x y z = v + w + x + y + z

-- C. Given a list, set its first element to the end. 
ejC:: [a] -> [a]
ejC (x:xs) = xs ++ [x]

-- D. Given a list, return a tuple with its minimum and maximum value.
ejD:: [Int] -> (Int, Int)
ejD x = (minimum x, maximum x)

-- E. Given a list, return if is a palindrome list or not. 
ejE:: [Int] -> Bool
ejE x = ejEAux x (reverse x)

ejEAux:: [Int] -> [Int] -> Bool
ejEAux [] [] = True
ejEAux (x:xs) (y:ys) = if (x == y) then ejEAux xs ys else False

-- F. Given a list, return it deleting the first and the last element.
ejF:: [Int] -> [Int]
ejF x = drop 1 (take ((length x) - 1) x)

-- G. Given a list, return the last n elements of it.
ejG:: Int -> [Int] -> [Int]
ejG n x = drop ((length x) - n) x

-- H. Given a list, return the first n elements and the last n elements of it.
ejH:: Int -> [Int] -> [Int]
ejH n x = (take n x) ++ (ejG n x)

-- I. Implement XOR function.
ejI:: Bool -> Bool -> Bool
ejI x y 
       | x && y = False
       | x && (not y) = True
       | (not x) && y = True
       | (not x) && (not y) = False
       
-- J. Given two rectangles, return the biggest.
ejJ:: (Int, Int) -> (Int, Int) -> (Int, Int)
ejJ (x, y) (u, v) = if ((x * y) >= (u * v)) then (x, y) else (u, v)

-- K. List range
ejK:: [Int] -> [Int]
ejK x = [minimum x, maximum x]

-- L. Given a list, return the first and the last n elements.
ejL:: Int -> [Int] -> [Int]
ejL n x = (take n x) ++ (reverse (take n (reverse x)))
