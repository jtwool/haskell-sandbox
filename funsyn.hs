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

bmi :: (RealFloat a) => a -> a -> String
bmi weight height
    | x <= skinny = "You're underweight!" 
    | x <= normal = "You're normal weight."
    | x <= fat    = "You're overweight!"
    | otherwise = "You're very overweight."
    where x = (weight * 0.45) / ((height * 0.025)^2)
 	  (skinny, normal, fat) = (18.5, 25.0, 30.0)

bmiPair :: (RealFloat a) => [(a,a)] -> [a]
bmiPair xs = [bmi w h | (w, h) <- xs]
	where bmi weight height = weight / height ^2

initialGetter :: String -> String -> String
initialGetter firstname lastname = [f] ++ "." ++ [l] ++ "."
	where (f:_) = firstname
	      (l:_) = lastname

initialGetter' :: String -> String -> String
initialGetter' (first:_) (last:_) = [first] ++ "." ++ [last] ++ "."

cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
	let  sideArea = 2*pi*r*h
	     topArea = pi*r^2
	in sideArea + 2 * topArea

