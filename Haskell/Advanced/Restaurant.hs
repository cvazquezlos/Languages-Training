module Restaurant where
 
type Free = [Table]
type Occupied = [Table]

data Table = Table {
                id:: Int,
                avaible:: Int}
data Occupation = o Free Occupied

instance Show Occupation where
   show (O Free Occupied) = "Free:\n" ++ show Free ++ "\nOccupied:\n" ++ show Occupied
   
instance Show Table where
   show (Table id avaible) = "Table " ++ show id ++ "-> Avaible:" ++ show avaible

instance Eq Table where
   Table id1 avaible1 == Table id2 avaible2 = ((avaible1 == avaible2) && (id1 == id2))
 
instance Ord Table where
   Table id1 avaible1 <= Table id2 avaible2 = avaible1 <= avaible2
   Table id1 avaible1 < Table id2 avaible2 = avaible1 < avaible2
   Table id1 avaible1 >= Table id2 avaible2 = avaible1 >= avaible2
   Table id1 avaible1 > Table id2 avaible2 = avaible1 > avaible2

insertFreeTable:: Occupation -> Table -> Occupation
insertFreeTable (O x y) u = O (insertFreeTableOrdered x u) y

insertFreeTableOrdered:: [Table] -> Table -> [Table]
insertFreeTableOrdered [] u = [u]
insertFreeTableOrdered (x:xs) u
                               | (u <= x) = (u:x:xs)
                               | otherwise = insertFreeTableOrdered xs u
                               
takeTable:: Occupation -> Int -> Occupation
takeTable (O x y) n = if ((id f) == -1) then (O [] []) else (O g h)
                         where
                            f = selectFreeTable x n
                            g = deleteTableFromFree x f
                            h = addOccupiedTable y f

selectFreeTable:: (Ord Table) => [Table] -> Int -> Table
selectFreeTable [] _ = Table -1 -1
selectFreeTable (x:xs) n = if (x < n) then selectFreeTable xs n
                                      else x
                                      
deleteTableFromFree:: (Eq Table) => [Table] -> Table -> [Table]
deleteTableFromFree [] u = []
deleteTableFromFree (x:xs) u = if (x == u) then xs else x:(deleteTable xs u)
 
addOccupiedTable:: [Table] -> Table -> [Table]
addOccupiedTable xs u = xs ++ [u]
