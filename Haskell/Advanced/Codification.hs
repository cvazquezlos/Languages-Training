module Codification where

stepA:: (a -> Bool) -> [a] -> ([a], [a])
stepA f x = (takeWhile f x, dropWhile f x)

stepB:: String -> [String]
stepB x = stepBAux x []

stepBAux:: String -> String -> [String]
stepBAux [] acum = [acum]
stepBAux (x:xs) acum = if (x /= ' ') then stepBAux xs (acum ++ [x])
                                     else acum:(stepBAux xs [])
                                     
stepC:: [String] -> [Int]
stepC x = map length x

stepC':: [String] -> [Int]
stepC' [] = 0
stepC' (x:xs) = (length x):(stepC' xs)

stepD:: [String] -> String
stepD [] = ""
stepD (x:xs) = x ++ (stepD xs)
