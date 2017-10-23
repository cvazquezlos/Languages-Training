module ListComprehension where

-- A. Average of the first n elements by themselves.
ejA:: Int -> Int
ejA n = sum [y^2 | y <- [1..n]]

-- B. Given a number and an element, return a list with repeated elements.
ejB:: Int -> a -> [a]
eejB n x = [x | y <- [1..n]]

-- C. Return the average of the first n elements.
ejC:: Int -> Int
ejC x = sum [y | y <- [1..x]]

-- D. Arithmetic triangle.
ejD:: Int -> [Int]
ejD x = [(ejC (x-1))+1..ejC x]

-- E. Draw arithmetic triangle till selected row.
ejE:: Int -> [[Int]]
ejE x = [ejD y | y <- [1..x]]

-- F. Return numbers perfects between 1 and the given number. 
ejF:: Int -> [Int]
ejF x = [y | y <- [1..(x-1)], sum [z | z <- [1..(y-1)], y `mod` z == 0] == y]

-- G. Abundant nums.
ejG:: Int -> Bool
ejG x = x < (sum [y | y <- [1..x], x `mod` y == 0])

-- H. List of abundant nums. 
ejH:: Int -> [Int]
ejH x = [y | y <- [1..(x-1)], ejG y]

-- I. All of abundant numbers are even.
ejI:: Int -> Bool
ejI x = all even (ejH x)

-- J. First odd abundant number.
ejJ:: Int
ejJ = head [x | x <- [1..], ejG x, odd x]

-- K. Return those numbers which are multiples of 3 or 5.
ejK:: Int -> Int
ejK x = sum [y | y <- [1..(x-1)], (y `mod` 3 == 0) || (y `mod` 5 == 0)]

-- L. Aproximation to e.
ejL:: Float -> [Float]
ejL x = [(1 + (1 / y)) ** y | y <- [1..x]]

-- M. Scalar product.
ejM:: [Int] -> [Int] -> Int
ejM x y = sum [u * v | (u, v) <- zip x y]

-- N. Consecutive numbers average.
ejN:: [Int] -> [Int]
ejN x = [u + v | (u, v) <- zip x (tail x)]

-- O. Return the position of repeated number.
ejO:: (Eq a) -> a -> [a] -> [Int]
ejO n x = [v | (u, v) <- zip x [0..(length x - 1)], u == n]

-- P. Dense polinom.
ejP:: [Int] -> [(Int, Int)]
ejP x = [(u, v) | (u, v) <- zip (reverse [0..(length x - 1)]) x, v /= 0]

-- Q. Merge two lists by using tuples.
ejQ:: [a] -> [b] -> [(a, b)]
ejQ x y = [(u, v) | u <- x, v <- y]

ejQ':: [a] -> [b] -> [(a, b)]
ejQ x y = [[(u, v) | v <- y] | u <- x]
