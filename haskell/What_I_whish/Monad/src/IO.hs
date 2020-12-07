module IO where

main :: IO ()
main =
  do
    putStrLn "Vesihiisi sihisi hississäään."
    putStrLn "Or in English: 'The water devil was hissing in her elevator'."
    putStrLn "What is your name: "
    name <- getLine
    putStrLn name
    putStrLn "What is your name:"
      >>= \_ ->
        getLine
          >>= \name -> putStrLn name
    putStrLn "What is your name: " >> (getLine >>= (\name -> putStrLn name))