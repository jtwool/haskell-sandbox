-- Chapter III from LearnYouAHaskell.com

herman = ["Giant","White","Whale"]

addVectors :: (Num a) => (a,a) -> (a,a) -> (a,a)
addVectors (x1, y1) (x2, y2) = (x1+y1, x2+y2)

first :: (a, b, c) -> a
first (x, _, _) = x 

second :: (a, b, c) -> b
second (_, x, _) = x 

third :: (a, b, c) -> c
third (_, _, x) = x

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

capital :: String -> String
capital "" = "Empty string, woops!"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

max' :: (Ord a) => a -> a -> a
max' a b
 | a > b = a
 | otherwise = b
