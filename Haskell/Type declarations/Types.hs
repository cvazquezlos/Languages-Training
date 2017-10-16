module Types where

-- A. Given a rational list, return those elements which are equivalent to other rational number.
type IntegerP = Int
type DecimalP = Int

type RationalN = (IntegerP, DecimalP) -- Type implementation.

ejA:: [RationalN] -> RationalN -> [(Float, Float)]
ejA [] _ = []
ejA ((x, y):xs) (u, v) = if ((x * v) == (y * u)) then (fromIntegral x, fromIntegral y):(ejA xs (u, v)) 
												 else ejA xs (u, v)
												 
data RationalN' = R (IntegerP, DecimalP) deriving Show -- Data implementation.

ejA':: [RationalN'] -> RationalN' -> [RationalN']
ejA' [] _ = []
ejA' ((R (x, y)):xs) (R (u, v)) = if ((x * v) == (y * u)) then (R (x, y)):(ejA' xs (R (u, v)))
												  else ejA' xs (R (u, v))
