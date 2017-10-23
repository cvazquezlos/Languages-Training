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

-- F. Split digits of given number.
ejF:: Int -> [Int]
ejF n
     | n < 10 = [n]
     | otherwise = (ejF (n `div` 10)) ++ [n `mod` 10]
     
-- G. Average of digits of given number.
ejG:: Int -> Int
ejG 0 = 0
ejG n = (n `mod` 10) + (ejG (n `div` 10))

-- H. Given a string, keep upper just the first char.
ejH:: String -> String
ejH (x:xs) toUpper x : [toLower y | y <- xs]

ejH':: String -> String
ejH [] = []
ejH (x:xs) = toUpper x : aux xs
                where
                    aux (x:xs) = toLower x : aux xs
                    aux [] = []
                    
-- I.
ejI:: [String] -> [String]
ejI (x:xs) = (ejH x):(ejI' xs)

ejI':: [String] -> [String]
ejI' [] = []
ejI' ((x:xs):xss) = if (length (x:xs)) >= 4 then (ejH (x:xs)):(ejI xss)
                                            else ((x:xs):(ejI xss))
