-- Following Chapter 5 in book.RealWorldHaskell.org
-- Haskell pretty printing program for JSON 
-- Links to PrettifyJSON.hs and PrettyStub.hs
module Prettify
    (
        fsep
      , (</>)
      , group
      , softline
      , flatten
      , punctuate 
      , text
      , empty 
      , double
      , fold
      , char
      , hcat
      , Doc
      , line
      , (<>)
      , compact
    ) where

data Doc = Empty
         | Char Char
         | Text String
         | Line
         | Concat Doc Doc
         | Union Doc Doc
            deriving (Show, Eq)

fsep :: [Doc] -> Doc
fsep = fold (</>)

(</>) :: Doc -> Doc -> Doc
x </> y = x <> softline <> y

softline :: Doc
softline = group line

group :: Doc -> Doc
group x = flatten x `Union` x

flatten :: Doc -> Doc
flatten (x `Concat` y) = flatten x `Concat` flatten y
flatten Line           = Char ' '
flatten (x `Union` _)   = flatten x
flatten other          = other

punctuate :: Doc -> [Doc] -> [Doc]
punctuate p []      = []
punctuate p [d]     = [d]
punctuate p (d:ds)  = (d <> p) : punctuate p ds

text :: String -> Doc
text "" = Empty
text s = Text s

empty :: Doc
empty = Empty

double :: Double -> Doc
double d = text (show d)

(<>) :: Doc -> Doc -> Doc
Empty <> y = y
x <> Empty = x
x <> y = x `Concat ` y

char :: Char -> Doc
char c = Char c

hcat :: [Doc] -> Doc
hcat = fold (<>)

fold :: (Doc -> Doc -> Doc) -> [Doc] -> Doc
fold f = foldr f empty

line :: Doc
line = Line

                  
compact :: Doc -> String
compact x = transform [x]
    where tranform [] = ""
          transform (d:ds) = 
            case d of 
                Empty           -> transform ds
                Char c          -> c : transform ds
                Text s          -> s ++ tranform ds
                Line            -> '\n' : transform ds
                a `Concat` b    -> transform (a:b:ds)
                _ `Union` b     -> transform (b:ds)s