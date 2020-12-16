{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DefaultSignatures #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveFoldable #-}
{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveTraversable #-}

module Extension9 where

import GHC.Generics

{- DeriveFunctor -}

data Tree a = Node a [Tree a]
  deriving (Show, Functor)

tree :: Tree Int
tree = fmap (+ 1) (Node 1 [Node 2 [], Node 3 []])

{- DeriveFoldable -}

data RoseTree a
  = RoseTree a [RoseTree a]
  deriving (Foldable)

data Tree' a
  = Leaf a
  | Branch (Tree' a) (Tree' a)
  deriving (Foldable)

-- instance Foldable RoseTree where
--   foldr f z (RoseTree a1 a2) =
--     f a1 ((\b3 b4 -> foldr (\b1 b2 -> foldr f b2 b1) b4 b3) a2 z)
--   foldMap f (RoseTree a1 a2) =
--     mappend (f a1) (foldMap (foldMap f) a2)
--   null (RoseTree _ _) = False

-- instance Foldable Tree' where
--   foldr f z (Leaf a1) = f a1 z
--   foldr f z (Branch a1 a2) =
--     (\b1 b2 -> foldr f b2 b1) a1 ((\b3 b4 -> foldr f b4 b3) a2 z)
--   foldMap f (Leaf a1) = f a1
--   foldMap f (Branch a1 a2) = mappend (foldMap f a1) (foldMap f a2)
--   null (Leaf _) = False
--   null (Branch a1 a2) = (&&) (null a1) (null a2)

{- DeriveTraversable -}

data Tree'' a = Node' a [Tree'' a]
  deriving (Show, Functor, Foldable, Traversable)

tree' :: Maybe [Int]
tree' = foldMap go (Node' [1] [Node' [2] [], Node' [3, 4] []])
  where
    go [] = Nothing
    go xs = Just xs

{- DeriveGeneric -}

data List a
  = Cons a (List a)
  | Nil
  deriving (Generic)

-- instance Generic (List a) where
--   type
--     Rep (List a) =
--       D1
--         ('MetaData "List" "Ghci3" "MyModule" 'False)
--         ( C1
--             ('MetaCons "Cons" 'PrefixI 'False)
--             ( S1
--                 ( 'MetaSel
--                     'Nothing
--                     'NoSourceUnpackedness
--                     'NoSourceStrictness
--                     'DecidedLazy
--                 )
--                 (Rec0 a)
--                 :*: S1
--                       ( 'MetaSel
--                           'Nothing
--                           'NoSourceUnpackedness
--                           'NoSourceStrictness
--                           'DecidedLazy
--                       )
--                       (Rec0 (List a))
--             )
--             :+: C1 ('MetaCons "Nil" 'PrefixI 'False) U1
--         )
--   from x =
--     M1
--       ( case x of
--           Cons g1 g2 -> L1 (M1 ((:*:) (M1 (K1 g1)) (M1 (K1 g2))))
--           Nil -> R1 (M1 U1)
--       )
--   to (M1 x) = case x of
--     (L1 (M1 ((:*:) (M1 (K1 g1)) (M1 (K1 g2))))) -> Cons g1 g2
--     (R1 (M1 U1)) -> Nil

{- DeriveAnyClass -}

class MinimalClass a where
  const1 :: a -> Int
  default const1 :: a -> Int
  const1 _ = 1

  const2 :: a -> Int
  default const2 :: a -> Int
  const2 _ = 2

data Example = Example
  deriving (MinimalClass)

main :: IO ()
main = do
  print (const1 Example)
  print (const2 Example)