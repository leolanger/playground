{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeApplications #-}

module Extension11 where

import Control.Applicative
import Data.Functor.Const (Const (..))
import Data.Proxy
import GHC.Exts (Any)

{- TypeApplications -}

-- This is particularly useful when working with typeclasses
-- where type inference cannot deduce the types of all subexpressions from the toplevel signature and results in an overly
-- specific default.

a :: Proxy Int
a = Proxy @Int

b :: String
b = show (read @Int "42")

{- DerivingVia -}

-- DerivingVia allows deriving instances by specifying a custom type
-- which has a runtime representation equal to the desired behavior we’re deriving the instance for.

newtype Age = MkAge Int
  deriving
    (Eq)
    via Const Int Any

newtype FNum f a = FNum (f a)
  deriving stock (Functor)
  deriving newtype (Applicative)

instance (Applicative f, Num a) => Num (FNum f a) where
  (+) = liftA2 (+)
  (-) = liftA2 (-)
  (*) = liftA2 (*)
  abs = fmap abs
  signum = fmap signum
  fromInteger = FNum . pure . fromInteger

newtype Example a b = Example (Either a b)
  deriving stock (Show, Functor)
  deriving newtype (Applicative)
  deriving (Num) via FNum (Either a) b

a' :: Example Integer Integer
a' = Example (Left 1)

b' :: Example Integer Integer
b' = Example (Right 1)

example :: IO ()
example = do
  print (a' + b')
  print (a' + a')
  print (b' + b')

{- DerivingStrategies -}

-- Turning on DerivingStrategies allows you to disambiguate
-- which algorithm GHC should use for individual class derivations.

-- ­stock Standard GHC builtin deriving (i.e. Eq , Ord , Show )
-- ­anyclass Deriving via minimal annotations with DeriveAnyClass.
-- newtype ­ Deriving with [GeneralizedNewtypeDeriving].
-- via ­ Deriving with DerivingVia.

newtype Example' = Example' Int
  deriving stock (Read, Show)
  deriving newtype (Num, Floating)
  deriving anyclass (ToJSON, FromJSON, ToSQL, FromSQL)
  deriving (Eq) via (Const Int Any)