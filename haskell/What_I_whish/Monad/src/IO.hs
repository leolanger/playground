module IO where

import Prelude hiding (Monad, return, (>>=))

class Monad m where
  return :: a -> m a
  (>>=) :: m a -> (a -> m b) -> m b

(>>) :: Monad m => m a -> m b -> m b
m >> k = m >>= \_ -> k

{- IO Monad-}
