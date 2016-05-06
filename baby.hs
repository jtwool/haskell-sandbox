-- Following along with the tutorial from LearnYouAHaskell.com

doubleMe x = x + x

doubleUS x y = x*2+y*2

doubleSmallNumber x = if x > 100
                         then x
                         else x*2

doubleSmallPlusOne x = (if x > 100 then x else x*2) + 1

boomBangs xs  = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

length'  xs = sum [1 | _ <- xs]

removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]
