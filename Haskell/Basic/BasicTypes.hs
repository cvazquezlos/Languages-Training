module BasicTypes where

import Data.Char

-- This file contains exercises about basic types (Int, Double, Float, Bool, Char, String),
-- lists, tuples, control elements like IF...THEN, CASE and |.

-- A. Given three integer numbers, return if they are correctly ordered from smaller to bigger.
ejA:: Int -> Int -> Int -> Bool
ejA x y z = if ((x < y) && (y < z)) then True else False

-- B. Given three integer numbers, return then ordered from smaller to bigger.
ejB:: Int -> Int -> Int -> (Int, Int, Int)
ejB x y z = (min x (min y z), middleValue x y z, max x (max y z))

middleValue:: Int -> Int -> Int -> Int
middleValue x y z 
                  | (((y < x) && (x < z)) || ((z < x) && (x < y))) = x
                  | (((x < y) && (y < z)) || ((z < y) && (y < x))) = y
                  | otherwise = z
                  
-- C. Given a real number, return (integer value, decimal value).
ejC:: Double -> (Int, Int)
ejC x = (truncate x, truncate ((x - fromInteger (truncate x))*100))

-- D. Given the radius of the circle, return (longitude, area).
ejD:: Double -> (Double, Double) -- Where function.
ejD x = (2 * phi * x, phi * x * x)
            where
                 phi = pi
                 
ejD':: Double -> (Double, Double) -- Let function.
ejD' x = let phi = pi in (2 * phi * x, phi * x * x)

-- E. Given two lists, concat them (no recursive, just list comprehension).
ejE:: [Int] -> [Int] -> [Int]
ejE x y = [z | z <- x] ++ [z | z <- y]

-- F. Given an integer number, return a list which contains its prime numbers.
ejF:: Int -> [Int]
ejF x = [z | z <- [1..x], x`mod`z == 0]

-- G. Given an integer number, return if the number is prime.
ejG:: Int -> Bool
ejG x = length (ejF x) == 2

-- H. Given a string, return how many of its characters are upper.
ejH:: String -> Int
ejH x = length [y | y <- x, isUpper y]

-- I. Given a 3-tuple where each tuple is a 2-tuple (String, Int), return the first element of each intern tuple using patterns.

ejI:: ((String, Int), (String, Int), (String, Int)) -> (Int, Int, Int)
ejI ((_, x), (_, y), (_, z)) = (x, y, z)

-- J. Given a list of integer numbers, return true if the sum of the first 4 elements is lower than 10.
ejJ:: [Int] -> Bool
ejJ (w:x:y:z:ws) = (w+x+y+z) < 10

-- K. Given a character, return its description as cardinal point.
ejK:: Char -> String
ejK 'N' = "North"
ejK 'S' = "South"
ejK 'E' = "East"
ejK 'W' = "West"
ejK x = "Invalid char"

-- L. Given a string, return a message which includes what is the first and the last character.
ejL:: String -> String
ejL x = "La primera letra de la frase ''" ++ x ++ "'' es '" ++ take 1 x ++ "' y"
 		++ " la ultima letra es '" ++ drop ((length x) - 1) x ++ "'"
        
-- M. Given a number, return if it is between 0 and 10, 10 and 20 or bigger than 20.
ejM:: Int -> String -- Version 1.
ejM x 
     | (x < 10) = "El valor de entrada es menor que 10"
     | ((x >= 10) && (x <= 20)) = "El valor de entrada es mayor o igual a 10 y menor o igual a 20"
     | otherwise = "El valor de entrada es mayor que 20"
     
ejM':: Int -> String -- Version 2.
ejM' x 
     | (x < 10) = s1 ++ " menor que 10"
     | ((x >= 10) && (x <= 20)) = s1 ++ " mayor o igual a 10 y menor o igual a 20"
     | otherwise = s1 ++ " mayor que 20"
        where
            s1 = "El valor de entrada es"
            
ejM'':: Int -> String -- Version 3.
ejM'' x = let s1 = "El valor de entrada es" in
                                             | (x < 10) = s1 ++ " menor que 10"
                                             | ((x >= 10) && (x <= 20)) = s1 ++ " mayor o igual a 10 y menor o igual a 20"
                                             | otherwise = s1 ++ " mayor que 20"
                                             
-- N. Given a string, return the number of apparitions of a char (just list comprehension).
ejN:: String -> Char -> Int
ejN x c = length [y | y <- x, y == c]