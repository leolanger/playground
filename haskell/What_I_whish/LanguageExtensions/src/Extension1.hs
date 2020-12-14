{-# LANGUAGE NoMonomorphismRestriction #-}

module Extension1 where

{- NoMonomorphismRestriction -}

-- The NoMonomorphismRestriction allows us to disable the monomorphism restriction typing rule GHC uses by default.

foo x y = x + y

bar = foo 1

-- get this without Extension
-- λ : bar 1.1
-- <interactive>:2:5: error:
--   No instance for (Fractional Integer)
--      arising from the literal ‘1.1’
--   In the first argument of ‘bar’, namely ‘1.1’
--      In the expression: bar 1.1
--      In an equation for ‘it’: it = bar 1.1

-- λ : :t bar
-- bar :: Integer -> Integer

-- with Extension
-- λ : :t bar
-- bar :: Integer -> Integer