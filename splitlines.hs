-- Chapter 4 book.RealWorldHaskell.org
-- Line splitting
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

--Partial and total functions

