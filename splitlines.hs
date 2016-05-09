-- Chapter 4 book.RealWorldHaskell.org
-- http://book.realworldhaskell.org/read/functional-programming.html
-- Line splitting
import Data.Maybe
import Data.Char (digitToInt)

splitLines :: String -> [String]
splitLines [] = []
splitLines cs = 
    let (pre, suf) = break isLineTerminator cs
    in pre : case suf of
                ('\r':'n':rest) -> splitLines rest
                ('r':rest)      -> splitLines rest
                ('\n':rest)     -> splitLines rest
                _               -> []

isLineTerminator :: Char -> Bool                
isLineTerminator c = c == '\r' || c == '\n'

fixLines :: String -> String
fixLines input = unlines (splitLines input)

--Section on Infix functions
data a `Pair` b = a `Pair` b
                  deriving (Show)
                  
foo = Pair 1 2
bar = 1 `Pair` 2

-- Data.Lists functions introduction

myDumbExample :: [Char] -> Char
myDumbExample xs = if length xs > 0
                   then head xs
                   else 'Z'
                   
mySmartExample :: [Char] -> Char                   
mySmartExample xs = if not (null xs)
                    then head xs
                    else 'Z'

myOtherExample :: [Char] -> Char
myOtherExample (x:_) = x
myOtherExample [] = 'Z'

-- Chapter Exercises
--Ex 1.
safeHead :: [a] -> Maybe a
safeHead (x:_) = Just x
safeHead _ = Nothing

safeTail :: [a] -> Maybe [a]
safeTail (_:xs) = Just xs
safeTail _ = Nothing

safeLast :: [a] -> Maybe a
safeLast [x] = Just x
safeLast (_:x) = safeLast x
safeLast _ = Nothing

sInit :: [a] -> Maybe [a]          
sInit y@(x:xs) = Just (sInit' y)
    where sInit' [x] = []
          sInit' (x:xs) = x : sInit' xs
sInit _ = Nothing

--splitWith :: (a->Bool) -> [a] -> [[a]]
splitWith p s = keep : (splitWith p s')
    where (keep,s') = break p s
splitWith p [] = ""

-- Looping
loop :: Int -> String -> Int 
asInt xs = loop 0 xs

loop i [] = i
loop i (x:xs) = let i' = i * 10 + digitToInt x
                in  loop i' xs

square :: [Double] -> [Double]
square (x:xs) = x*x : square xs
square [] = []
                
