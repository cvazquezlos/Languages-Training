module ListComprehension where

-- A. Average of the first n elements by themselves.
ejA:: Int -> Int
ejA n = sum [y^2 | y <- [1..n]]

-- B. Given a number and an element, return a list with repeated elements.
ejB:: Int -> a -> [a]
ejB n x = [x | y <- [1..n]]

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
