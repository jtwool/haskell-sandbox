-- Following allong with LearnYouAHaskell.com tutorial
-- Chapter II code on types and typefaces

removeNonUpper :: [Char] -> [Char]
removeNonUpper st = [c | c <- st, c `elem` ['A'..'Z']]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x+y+z

-- Type demonstrations

-- Integer for really big ints, Int for standard Ints
factorial :: Integer -> Integer
factorial n = product [1..n]

-- Float for single precision decimals, double for double precision
circumference :: Float -> Float
circumference r = 2*pi*r
