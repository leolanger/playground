module Main

main : IO ()
main = do
    putStr "Enter your name: "
    x <- getLine
    putStrLn ("Hello " ++ x ++ "!")

printLength : IO ()
printLength = getLine >>= \input => let len = length input in
                                        putStrLn (show len)

printTwoThings : IO ()
printTwoThings = do putStrLn "Hello"
                    putStrLn "World"