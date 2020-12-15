{-# LANGUAGE PatternGuards #-}
{-# LANGUAGE ViewPatterns #-}
{-# LANGUAGE NoMonomorphismRestriction #-}

module Extension5 where

import Safe

{- PatternGuards -}

combine :: (Eq a1, Num a2) => [(a1, a2)] -> a1 -> a1 -> Maybe a2
combine env x y
  | Just a <- lookup x env,
    Just b <- lookup y env =
    Just $ a + b
  | otherwise = Nothing

{- ViewPatterns -}

-- View patterns are like pattern guards that can be nested inside of other patterns.

lookupDefault :: Eq a => a -> b -> [(a, b)] -> b
lookupDefault k _ (lookup k -> Just s) = s
lookupDefault _ d _ = d

headTup :: (a, [t]) -> [t]
headTup (headMay . snd -> Just n) = [n]
headTup _ = []

headNil :: [a] -> [a]
headNil (headMay -> Just x) = [x]
headNil _ = []