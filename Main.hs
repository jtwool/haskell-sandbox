-- Chapter 5 of book.RealWorldHaskell.org
-- Program to use code from SimpleJSON.hs

module Main (main) where

import SimpleJSON

main = print (JObject [("foo", JNumber 1), ("bar", JBool False)]) 