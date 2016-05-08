-- Chapter 4 of book.RealWorldHaskell.org
-- Interact.hs
-- Read one file as input, saves to a file as output

import System.Environment (getArgs)

interactWith function inputFile outputFile = do
    input <- readFile inputFile
    writeFile outputFile (function input)
    
main = mainWith myFunction
    where mainWith function = do
            args <- getArgs
            case args of
                [input,output] -> interactWith function input output
                _ -> putStrLn "Error: exactly two arguments needed"
                
          -- replace "id" with the name of our function below
          myFunction = id