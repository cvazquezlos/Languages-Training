module Types2 where

import Data.Monoid

-- A. Given a list, order it following the quicksort method.
ejA:: (Eq a, Ord a) => [a] -> [a]
ejA [] = []
ejA (x:xs) = (ejA small) ++ mid ++ (ejA large)
			    where
			       small = [y | y <- xs, y < x]
			       mid = [y | y <- xs, y == x] ++ [x]
			       large = [y | y <- xs, y > x]
			       
-- B. Given a number and a list, return the same list divided by the number.
ejB:: (Eq a, Num a, Integral a) => a -> [a] -> [Maybe a]
ejB _ [] = []
ejB n (x:xs) = if (x /= 0) then (Just (n `div` x)):(ejB n xs)
						   else (Nothing:(ejB n xs))
						   
-- C. Print a binary tree.
data BinTree a = ET | Branch (BinTree a) a (BinTree a)

ejC:: BinTree a -> String
ejC ET = ""
ejC Branch (BinTree x) y (BinTree z) = (ejC (BinTree x)) ++ "|-" ++ y ++ "-|" ++ (ejC (BinTree z))
