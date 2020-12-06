module IO where

import GHC.IO.Handle
import GHC.IO.Handle.FD (stdout)
import GHC.IO.Handle.Text (hPutStrLn)
import Prelude (Bool, IO, String)

class Monad m where
  return :: a -> m a
  (>>=) :: m a -> (a -> m b) -> m b
  (>>) :: m a -> m b -> m bk

{- IO Monad-}

putStrLn :: String -> IO ()
putStrLn s = hPutStrLn stdout s

main :: IO ()
main = do putStrLn "Vesihiisi sihisi hississäään."

getLine :: IO String
