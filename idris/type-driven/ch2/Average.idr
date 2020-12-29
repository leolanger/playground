module Average

average : (str : String) -> Double
average str = let numWords = wordCount str
                  totalLength = sum (allLengths (words str)) 
              in
                  cast totalLength / cast numWords
  where
    wordCount : String -> Nat
    wordCount str = length (words str)

    allLengths : List String -> List Nat
    allLengths strs = map length strs
    
showAverage : String -> String
showAverage str = "The average word length is: " ++
                  show (average str) ++ "\n"

main : IO ()
main = repl " Enter a string: " showAverage

-- Idris> words "'Twas brillig, and the slithy toves"
-- ["'Twas", "brillig,", "and", "the", "slithy", "toves"] : List String

-- Idris> unwords ["One", "two", "three", "four!"]
-- "One two three four!" : String

-- Idris> length ["One", "two", "three", "four!"]
-- 4 : Nat