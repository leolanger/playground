{-# LANGUAGE EmptyCase #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}
{-# LANGUAGE PostfixOperators #-}
{-# LANGUAGE TupleSections #-}

module Extension6 where

import Data.Text

{- TupleSections -}

-- The TupleSections syntax extension allows tuples to be constructed similar to how operator sections.

first :: a -> (a, Bool)
first = (,True)

second :: a -> (Bool, a)
second = (True,)

f :: t -> t1 -> t2 -> t3 -> (t, (), t1, (), (), t2, t3)
f = (,(),,(),(),,)

{- PostfixOperators -}

-- The postfix operators extensions allows user­defined operators that are placed after expressions.

(!) :: Integer -> Integer
(!) n = product [1 .. n]

example :: Integer
example = (52 !)

{- MultiWayIf -}

bmiTell :: Float -> String
bmiTell bmi =
  if
      | bmi <= 18.5 -> "Underweight"
      | bmi <= 25.0 -> "Average weight"
      | bmi <= 30.0 -> "Overweight"
      | otherwise -> "Clinically overweight"

{- EmptyCase -}

-- GHC normally requires at least one pattern branch in a case statement;
-- this restriction can be relaxed with the EmptyCase language extension.
-- The case statement then immediately yields a Non-exhaustive patterns in case if evaluated.

-- test = case of

{- LambdaCase -}

-- Without LambdaCase:
-- \temp -> case temp of
--     p1 -> 32
--     p2 -> 32

-- With LambdaCase:
-- \case
--     p1 -> 32
--     p2 -> 32

data Exp a
  = Lam a (Exp a)
  | Var a
  | App (Exp a) (Exp a)

example' :: Exp a -> a
example' = \case
  Lam a b -> a
  Var a -> a
  App a b -> example' a
