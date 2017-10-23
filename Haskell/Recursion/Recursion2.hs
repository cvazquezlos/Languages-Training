module Recursion2 where

-- A. Return a given number powered.
ejA:: Int -> Int -> Int
ejA _ 0 = 1
ejA x y = x * (ejA x (y-1))

-- B. Euclides algorithm.
ejB:: Int -> Int -> Int
ejB x 0 = x
ejB x y = ejB y (x `mod` y)

-- C. Check if an element is present in a list.
ejC:: Int -> [Int] -> Bool
ejC _ [] = False
ejC n (x:xs) = if (n == x) then True
                           else n xs

-- D. Return last element of a list.
ejD:: [a] -> a
ejD [x] = x
ejD (x:xs) = ejD xs

-- E. Concat.
ejE:: [[a]] -> [a]
ejE [] = []
ejE (x:xs) = x ++ ejE xs

