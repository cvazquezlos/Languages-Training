module Types where

-- A. Given a rational list, return those elements which are equivalent to other rational number.
type IntegerP = Float
type DecimalP = Float

type RationalN = (IntegerP, DecimalP) -- Type implementation.

ejA:: [RationalN] -> RationalN -> [RationalN]
ejA [] _ = []
ejA ((x, y):xs) (u, v) = if ((x * v) == (y * u)) then (x, y):(ejA xs (u, v)) 
						 else ejA xs (u, v)
												 
data RationalN' = R (IntegerP, DecimalP) deriving Show -- Data implementation.

ejA':: [RationalN'] -> RationalN' -> [RationalN']
ejA' [] _ = []
ejA' ((R (x, y)):xs) (R (u, v)) = if ((x * v) == (y * u)) then (R (x, y)):(ejA' xs (R (u, v)))
							  else ejA' xs (R (u, v))
							  
-- B. Given points and distances, calculate the correct direction, distance and movements.
type AxisX = Float
type AxisY = Float  

data Direction = North | South | East | West deriving Show
type Point = (AxisX, AxisY)

ejB1:: Direction -> Point -> Point
ejB1 North (u, v) = (u, v + 1)
ejB1 South (u, v) = (u, v - 1)
ejB1 East (u, v) = (u + 1, v)
ejB1 West (u, v) = (u - 1, v)

ejB2:: Point -> Point -> Point
ejB2 (x, y) (u, v) = if (y > u) then (x, y) else (u, v)

ejB3:: Point -> Point -> Float
ejB3 (x, y) (u, v) = (((x - u)^^2) + ((y - v)^^2))**(0.5)

ejB4:: Point -> [Direction] -> [Point]
ejB4 _ [] = []
ejB4 p (x:xs) = f:(ejB4 f xs)
		   where
		      f = ejB1 x p
