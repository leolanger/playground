module Maybe where

import Prelude (Int, Maybe (Just, Nothing), ($), (+))

class Monad m where
  return :: a -> m a
  (>>=) :: m a -> (a -> m b) -> m b
  (>>) :: m a -> m b -> m b

-- data Maybe a = Nothing | Just a

{- Maybe Monad -}

instance Monad Maybe where
  (Just x) >>= k = k x -- 'k' is a function with type (a -> Maybe a)
  Nothing >>= k = Nothing
  return = Just
  m >> k = m >>= \_ -> k

-- eg.

-- (Just 3) >>= (\x -> return (x + 1))
-- -- Just 4

-- Nothing >>= (\x -> return (x + 1))
-- -- Nothing

-- return 4 :: Maybe Int
-- -- Just 4

example1 :: Maybe Int
example1 = do
  a <- Just 3
  b <- Just 4
  return $ a + b

-- Just 7

desugard1 :: Maybe Int
desugard1 =
  Just 3 >>= \a ->
    Just 4 >>= \b ->
      return $ a + b

-- Just 7

example2 :: Maybe Int
example2 = do
  a <- Just 3
  b <- Nothing
  return $ a + b

-- Nothing

desugard2 :: Maybe Int
desugard2 =
  Just 3 >>= \a ->
    Nothing >>= \b ->
      return $ a + b

-- Nothing

