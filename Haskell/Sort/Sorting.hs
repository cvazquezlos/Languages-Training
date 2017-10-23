module Sorting where

----------------------------------------------------------------------------------------------
----------------------------------------- MERGE SORT -----------------------------------------
----------------------------------------------------------------------------------------------
mergeTwoOrderedLists:: (Ord a) => [a] -> [a] -> [a]
mergeTwoOrderedLists [] x = x
mergeTwoOrderedLists x [] = x
mergeTwoOrderedLists (x:xs) (y:ys) = if (x <= y) then x:(mergeTwoOrderedLists xs (y:ys))
                                                 else y:(mergeTwoOrderedLists (x:xs) ys)
                                                 
splitList:: [a] -> ([a], [a])
splitList x = splitListAux x ((length x) `div` 2) []

splitListAux:: [a] -> Int -> [a] -> ([a], [a])
splitListAux x 0 acum = (acum, x)
splitListAux (x:xs) n acum = splitListAux xs (n - 1) (x:acum)

mergeSort:: (Ord a) => [a] -> [a]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort x = mergeTwoOrderedLists (mergeSort u) (mergeSort v)
                where
                  (u, v) = splitList x
                  
isSorted:: (Ord a) => [a] -> Bool
isSorted [] = True
isSorted [x] = True
isSorted (x:y:xs) = if (x < y) then isSorted (y:xs) else False
                 -- (x < y) && isSorted (y:xs)
