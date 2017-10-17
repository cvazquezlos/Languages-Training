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

-- C. Given a day of the week, return if is laborable or not.
data Week = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday

ejC:: Week -> String
ejC Monday = "Laborable"
ejC Tuesday = "Laborable"
ejC Wednesday = "Laborable"
ejC Thursday = "Laborable"
ejC Friday = "Laborable"
ejC _ = "Free time!!"

-- D. Change between temperature units and send orders to air conditioner elements.
data Temperature = Celsius (Float) | Fahrenheit (Float) deriving Show
data AirConditioner = On | Off deriving Show

ejD2:: Temperature -> Temperature
ejD2 (Celsius (x)) = Fahrenheit (((x * 9) / 5) + 32)
ejD2 (Fahrenheit (x)) = Celsius (((x - 32) * 5) / 9)

ejD4:: Temperature -> AirConditioner
ejD4 (Celsius (x)) = if (x < 28) then On else Off
ejD4 (Fahrenheit (x)) = ejD4 (ejD2 (Fahrenheit (x)))

-- E. Switch between eur and dollars.
data Coin = Eur Float | Dollar Float

ejE:: Coin -> Coin
ejE (Eur x) = (Dollar (x * 1.14))
ejE (Dollar x) = (Eur (x / 1.14))
