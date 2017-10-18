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
data BinTree a = ET | Branch (BinTree a) a (BinTree a) deriving Show

ejC:: (Show a) => BinTree a -> String
ejC ET = ""
ejC (Branch ET x ET) = show x
ejC (Branch x y z) = "(" ++ (ejC x) ++ ")|-" ++ show y ++ "-|(" ++ (ejC z) ++ ")"

-- D. Mirror tree.
ejD:: BinTree a -> BinTree a
ejD ET = ET
ejD (Branch left root right) = Branch (ejD right) root (ejD left) 

-- E. Return the list of students of asociations.
type Name = String

data Titulation = GradoII | GradoADE_II | GradoADE deriving Show
type Student = (Name, Titulation)

listofstudents:: [Student]
listofstudents = [("Pepe Jaja", GradoII), ("Pepe Jeje", GradoADE), ("Pepe Jiji", GradoADE_II),
		  ("Pepe Jojo", GradoII), ("Pepe Juju", GradoADE_II)] 

listofstudentsAso:: [String]
listofstudentsAso = ["Pepe Jaja", "Pepe Jiji"]

ejE:: ([Student], [String]) -> String -- Call of this method is ejE (listofstudents, listofstudentsAso)
ejE ([], _) = ""
ejE (_, []) = ""
ejE (((x, y):xs), (u:us)) = if (x /= u) then ejE (xs, (u:us)) 
					else "(" ++ x ++ "," ++ show y ++ ")" ++ ejE (xs, us)
 										
-- F. Give a Date type correct format.
type D = Int
type M = Int
type Y = Int

data Dat = Date D M Y 

instance Show Dat where
show (Date day month year) = toString [d, m, y]
			     	where
				    d = day
				    m = month
				    y = year
								 		
toString:: (Show a, Num a, Ord a) => [a] -> String
toString [] = ""
toString [x] = show x
toString (x:xs) = if (x < 10) then "0" ++ show x ++ "/" ++ toString xs
			      else show x ++ "/" ++ toString xs
								 		
-- G. Compare two dates.
instance Eq Dat where
Date d1 m1 y1 == Date d2 m2 y2 = (d1 == d2) && (m1 == m2) && (y1 == y2)

ejG:: Dat -> Dat -> Bool
ejG x y = x == y
