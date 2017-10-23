module Matrix where

traspose:: [[a]] -> [[a]]
traspose [] = []
traspose ([]:xss) = traspose xss
traspose ((x:xs):xss) = (x:[u | (u:_) <- xss]):(traspose (xs: [v | (_:v) <- xss]))
