module Reader where

{- Reader Monad -}

newtype Reader r a = Reader {runReader :: r -> a}

instance Functor (Reader r) where
  fmap f mr = Reader (\r -> f (runReader mr r))

instance Applicative (Reader r) where
  pure x = Reader (\_ -> x)
  rf <*> rx = Reader (\r -> (runReader rf r) (runReader rx r))

instance Monad (Reader r) where
  return a = Reader $ \_ -> a
  m >>= k = Reader $ \r -> runReader (k (runReader m r)) r

ask :: Reader a a
ask = Reader id

asks :: (r -> a) -> Reader r a
asks f = Reader f

local :: (r -> r) -> Reader r a -> Reader r a
local f m = Reader $ runReader m . f

data MyContext = MyContext
  { foo :: String,
    bar :: Int
  }
  deriving (Show)

computation :: Reader MyContext (Maybe String)
computation = do
  n <- asks bar
  x <- asks foo
  if n > 0
    then return (Just x)
    else return Nothing

ex1 :: Maybe String
ex1 = runReader computation $ MyContext "hello" 1
