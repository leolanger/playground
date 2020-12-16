{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE NumDecimals #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module Extension7 where

import Data.Text

{- NumDecimals -}

-- The extension NumDecimals allows the use of exponential notation for integral literals that are not necessarily floats.

googol :: Fractional a => a
googol = 1e100

googol' :: Num a => a
googol' = 1e100

{- PackageImports -}

-- The syntax language extension PackageImports allows us to disambiguate hierarchical package names by their re­spective package key.

{- RecordWildCards -}

-- Record wild cards allow us to expand out the names of a record as variables scoped as the labels of the record implicitly.

data Example = Example
  { e1 :: Int,
    e2 :: Text,
    e3 :: Text
  }
  deriving (Show)

scope :: Example -> (Int, Text, Text)
scope Example {..} = (e1, e2, e3)

assign :: Example
assign = Example {..}
  where
    (e1, e2, e3) = (1, "Kirk", "Picard")

{- NamedFieldsPuns -}

-- NamedFieldPuns provides alternative syntax for accessing record fields in a pattern match.

data D = D {a :: Int, b :: Int}

f :: D -> Int
f D {a, b} = a - b

g :: D -> Int
g D {b, a} = a - b