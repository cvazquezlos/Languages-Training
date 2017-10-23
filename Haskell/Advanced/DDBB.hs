module DDBB where

people:: [(String, String, Int, Int)] 
people = [("Cervantes", "Literature", 1547, 1616), 
          ("Velazquez", "Art", 1599, 1660), 
          ("Picasso", "Art", 1881, 1973), 
          ("Beethoven", "Music", 1770, 1823), 
          ("Poincare", "Sciences", 1854, 1912), 
          ("Quevedo", "Literature", 1580, 1654), 
          ("Goya", "Art", 1746, 1828), 
          ("Einstein", "Sciences", 1879, 1955), 
          ("Mozart", "Music", 1756, 1791), 
          ("Botticelli", "Art", 1445, 1510), 
          ("Borromini", "Architecture", 1599, 1667), 
          ("Bach", "Music", 1685, 1750)]
          
names:: [(String, String, Int, Int)] -> [String]
names db = [x | (x, _, _, _) <- db]

artists:: [(String, String, Int, Int)] -> [String]
artists db = [x | (x, y, _, _) <- db, y == "Art"]

select:: [(String, String, Int, Int)] -> String -> [String]
select db a = [x | (x, y, _, _) <- db, y == a]

musicians:: [(String, String, Int, Int)] -> [String]
musicians db = select db "Music"

alive:: [(String, String, Int, Int)] -> Int -> [String]
alive db a = [x | (x, _, u, v) <- db, (u < a) && (a < v)
