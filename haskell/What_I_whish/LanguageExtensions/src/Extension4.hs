{-# LANGUAGE PartialTypeSignatures #-}
{-# LANGUAGE RecursiveDo #-}

module Extension4 where

{- PartialTypeSignatures -}

-- Normally a function is either given a full explicit type signature or none at all.
-- The partial type signature extension allows something in between.

-- triple :: Int -> ((Int, Int, Int))
triple :: Int -> _
triple i = (i, i, i)

{- RecursiveDo -}

-- Recursive do notation allows for the use of self­reference expressions on both sides of a monadic bind.

justOnes :: Maybe [Int]
justOnes = do
  rec xs <- Just (1 : xs)
  return (map negate xs)

{- ApplicativeDo -}

test :: Applicative m => m (a, b, c)
test = do
  a <- f
  b <- g
  c <- h
  return (a, b, c)

-- equivalent to the traditional notation

test :: Applicative m => m (a, b, c)
test = (,,) <$> f <*> g <*> h