{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Lib
  (
  )
where

import Prelude (Bool, Either, Int, Maybe, not)

{- Minimal Annotations -}

-- If an instance does not satisfy the minimal complete definition, then a warning is generated.
-- This can be useful when a class has methods with circular defaults.

class Eq a where
  (==), (/=) :: a -> a -> Bool
  x == y = not (x /= y)
  x /= y = not (x == y)
  {-# MINIMAL (==) | (/=) #-}

{- TypeSynonymInstances -}

-- Type synonyms introduce a “naming indirection” that can be included
-- in the instance search to allow you to write synonym instances for multiple synonyms which expand to concrete types.

type IntList = [Int]

class MyClass a

-- | Without type synonym instances, we're forced to manually expand out type
-- | synonyms in the typeclass head.
instance MyClass [Int]

-- With it GHC will do this for us automatically. Type synonyms still need to
-- be fully applied.
instance MyClass IntList

{- FLexibleInstances -}

-- Normally the head of a typeclass instance must contain only a type constructor applied to any number of type variables.
-- like `instance Monad Maybe m`

-- The FlexibleInstances extension
-- loosens this restriction to allow arbitrary nesting and non­type variables to be mentioned in the head definition.

-- This extension also implicitly enables TypeSynonymInstances .

class MyClass' a

-- Without flexible instances, all instance heads must be type variable. The
-- following would be legal.
instance MyClass' (Maybe a)

-- With flexible instances, typeclass heads can be arbitrary nested types. The
-- following would be forbidden without it.
instance MyClass' (Maybe Int)

{- FlexibleContexts -}

-- Just as with instances, contexts normally are also constrained to consist entirely of constraints where a class is applied to just type variables.

-- There is however still a global restriction that all class hierarchies must not contain cycles.
class MyClass'' a

-- | Without flexible contexts, all contexts must be type variable. The
-- | following would be legal
instance (MyClass'' a) => MyClass'' (Either a b)

-- With flexible contexts, typeclass contexts can be arbitrary nested types. The
-- following would be forbidden without it.
instance (MyClass'' (Maybe a)) => MyClass'' (Either a b)

{- OverlappingInstances -}

class MyClass1 a b where
  fn :: (a, b)

instance {-# OVERLAPPING #-} MyClass1 Int b where
  fn = error "b"

instance {-# OVERLAPPING #-} MyClass1 a Int where
  fn = error "a"

instance {-# OVERLAPPING #-} MyClass1 Int Int where
  fn = error "c"

example :: (Int, Int)
example = fn

{- IncoherentInstances -}

class MyClass2 a b where
  fn1 :: (a, b)

instance MyClass2 Int b where
  fn1 = error "a"

instance MyClass2 a Int where
  fn1 = error "b"

example1 :: (Int, Int)
example1 = fn1
