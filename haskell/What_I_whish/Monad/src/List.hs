module List where

import Prelude hiding (Monad, return, (>>=))

class Monad m where
  return :: a -> m a
  (>>=) :: m a -> (a -> m b) -> m b

(>>) :: Monad m => m a -> m b -> m b
m >> k = m >>= \_ -> k

{- List Monad -}

instance Monad [] where
  m >>= f = concat (map f m)
  return x = [x]

m :: [Int]
m = [1, 2, 3, 4]

f :: p -> [Integer]
f = \x -> [1, 0]

-- m >>= f
-- ==> [1,2,3,4] >>= \x -> [1,0]
-- ==> concat (map (\x -> [1,0]) [1,2,3,4])
-- ==> concat ([[1,0],[1,0],[1,0],[1,0]])
-- ==> [1,0,1,0,1,0,1,0]

-- The list comprehension syntax in Haskell can be implemented in terms of the list monad.

-- a = [f x y | x <- xs, y <- ys, x == y]

-- b = do
--   x <- xs
--   y <- ys
--   guard $ x == y
--   return $ f x y

example :: [(Int, Int, Int)]
example = do
  a <- [1, 2]
  b <- [10, 20]
  c <- [100, 200]
  return (a, b, c)

-- [(1,10,100),(1,10,200),(1,20,100),(1,20,200),(2,10,100),(2,10,200),(2,20,100),(2,20,200)]

desugared :: [(Int, Int, Int)]
desugared =
  [1, 2] >>= \a ->
    [10, 20] >>= \b ->
      [100, 200] >>= \c ->
        return (a, b, c)

-- [(1,10,100),(1,10,200),(1,20,100),(1,20,200),(2,10,100),(2,10,200),(2,20,100),(2,20,200)]
