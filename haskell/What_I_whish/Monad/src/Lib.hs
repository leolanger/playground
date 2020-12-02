module Lib
  (
  )
where

import Data.Void
import Prelude hiding (Monad, (>>=))

{-Monad Methods-}

class Monad m where
  return :: a -> m a
  (>>=) :: m a -> (a -> m b) -> m b

(>>) :: Monad m => m a -> m b -> m b
m >> k = m >>= \_ -> k

{-Monad Laws-}

-- Law 1

-- return a >>= f === f a
-- 'a' refers to a value, not a type

-- Law 2

-- m >>= return === m
-- 'm' here refers to a value that has type 'm a'

-- (SomeMonad val) >>= return ≡ SomeMonad val
-- -- 'SomeMonad val' has type 'm a' just
-- -- like 'm' from the first example of the
-- -- second law
-- NullaryMonadType >>= return ≡ NullaryMonadType

-- Law 3

-- (m >>= f) >>= g === m >>= (\x -> f x >>= g)
-- Like in the last law, 'm' has
-- has type 'm a'. The functions 'f'
-- and 'g' have types '(a -> m b)'
-- and '(b -> m c)' respectively

-- ((SomeMonad val) >>= f) >>= g ≡ (SomeMonad val) >>= (\x -> f x >>= g)

{-Do Notation-}

-- The desugaring is defined recursively by the rules:

-- do { a <- f ; m } ≡ f >>= \a -> do { m } -- bind 'f' to a, proceed to desugar
--                                          -- 'm'
-- do { f ; m } ≡ f >> do { m }             -- evaluate 'f', then proceed to
--                                          -- desugar m
-- do { m } ≡ m

-- Law 1

-- do y <- return x
--    f y
-- = do f x

-- Law 2

-- do x <- m
--   return x
-- = do m

-- Law 3

-- do b <- do a <- m
--     f a
--     g b

-- = do a <- m
--     b <- f a
--     g b

-- = do a <- m
--      do b <- f a
--         g b