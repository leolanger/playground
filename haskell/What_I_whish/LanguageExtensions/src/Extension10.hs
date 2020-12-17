{-# LANGUAGE DuplicateRecordFields #-}

module Extension10 where

-- Since base 4.10.0.0
import GHC.OverloadedLabels (IsLabel (..))
import GHC.Records (HasField (..))

{- DuplicateRecordFields -}

-- DuplicateRecordFields extensions which loosens GHC’s restriction on records in the same module with identical accessors.
-- The precise type that is being projected into is now deferred to the callsite.

data Person = Person {id :: Int}

data Animal = Animal {id :: Int}

data Vegetable = Vegetable {id :: Int}

test :: (Person, Animal, Vegetable)
test = (Person {id = 1}, Animal {id = 2}, Vegetable {id = 3})

test' :: (Int, Int, Int)
test' = (id (Person 1), id (Animal 2), id (Animal 3))

{- OverloadedLabels -}

-- OverloadedLabels extension which allows a limited form of polymorphism over labels that share the same name.

data S = MkS {foo :: Int}

data T x y z = forall b. MkT {foo :: y, bar :: b}

instance HasField x r a => IsLabel x (r -> a) where
  fromLabel = getField

main :: IO ()
main = do
  print (#foo (MkS 42))
  print (#foo (MkT True False))
