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
ejD' x = 