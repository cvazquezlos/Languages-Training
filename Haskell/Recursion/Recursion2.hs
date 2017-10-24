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

-- J. 
ejJ:: Char -> Int -> Int -> [String] -> [String]
ejJ c pos lon x = [y | y <- x, length y == lon, y!!pos == c]

ejJ':: Char -> Int -> Int -> [String] -> [String]
ejJ' _ _ _ [] = []
ejJ' c pos lon (x:xs) = if ((length x == lon) && (x!!pos == c)) then x:f else f
                          where
                            f = ejJ' c pos lon xs
                          
-- K. 
ejK:: String -> Char -> [Int]
ejK x c = [v | (u, v) <- zip x [0..], u == c]

ejK':: String -> Char -> [Int]
ejK' x c = ejK'Aux x c 0

ejK'Aux:: String -> Char -> Int -> [Int]
ejK'Aux [] _ _ = []
ejK'Aux (x:xs) c acum = if (x == c) then acum:f
                                    else f
                          where
                            f = ejK'Aux xs c (acum + 1)
                            
-- L. 
ejL:: String -> String -> Bool
ejL x y = ejLAux x y y

ejLAux:: String -> String -> String -> Bool
ejLAux _ [] _ = True
ejLAux [] _ _ = False
ejLAux (x:xs) (u:us) acum = if (x == u) then ejLAux xs us
                                        else ejLAux xs acum
