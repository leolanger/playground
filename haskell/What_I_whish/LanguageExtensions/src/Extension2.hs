{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings #-}

module Extension2 where

{- ExtendedDefaultRules -}

-- When an ambiguous literal is typechecked, if at least one of its typeclass constraints is numeric and all of its classes are
-- standard library classes, the module’s default list is consulted, and the first type from the list that will satisfy the context
-- of the type variable is instantiated.

-- default (C1 a,...,Cn a)

-- The following set of heuristics is used to determine what to instantiate the ambiguous type variable to.
-- 1. The type variable a appears in no other constraints
-- 2. All the classes Ci are standard.
-- 3. At least one of the classes Ci is numerical.

import qualified Data.Text as T

default (T.Text)

example = "foo"
