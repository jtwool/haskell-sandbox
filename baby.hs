-- Following along with the tutorial from LearnYouAHaskell.com

doubleMe x = x + x

doubleUS x y = x*2+y*2

doubleSmallNumber x = if x > 100
                         then x
                         else x*2

doubleSmallPlusOne x = (if x > 100 then x else x*2) + 1
