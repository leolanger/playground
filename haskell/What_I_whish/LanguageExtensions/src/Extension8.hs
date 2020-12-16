{-# LANGUAGE PatternSynonyms #-}

module Extension8 where

{- PatternSynonyms -}

-- Suppose we were writing a typechecker, and we needed to parse type signatures.
-- One common solution would to include a TArr to pattern match on type function signatures.
-- Even though, technically it could be written in terms of more basic application of the (->) constructor.

-- With pattern synonyms we can eliminate the extraneous constructor without losing the convenience of pattern matching
-- on arrow types.
-- We introduce a new pattern using the pattern keyword.

import Data.List (foldl', foldl1')

type Name = String

type Tvar = String

type TyCon = String

data Type
  = TVar Tvar
  | TyCon TyCon
  | TApp Type Type
  deriving (Show, Eq, Ord)

pattern TArr :: Type -> Type -> Type
pattern TArr t1 t2 = TApp (TApp (TyCon "(->)") t1) t2

tapp :: TyCon -> [Type] -> Type
tapp tcon args = foldl TApp (TyCon tcon) args

arr :: [Type] -> Type
arr ts = foldl1' (\t1 t2 -> tapp "(->)" [t1, t2]) ts

elimTArr :: Type -> [Type]
elimTArr (TArr (TArr t1 t2) t3) = t1 : t2 : elimTArr t3
elimTArr (TArr t1 t2) = t1 : elimTArr t2
elimTArr t = [t]

to :: Type
to = arr [TVar "a", TVar "b", TVar "a"]

from :: [Type]
from = elimTArr to
