{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE UndecidableInstances #-}

module FusedEffects where

import Control.Algebra hiding (Effect, Has)
import Control.Exception
import Control.Monad.Identity
import Polysemy
import Polysemy.Error

type Has eff sig m = (Members eff sig, Algebra sig m)

data State s m k = Get (s -> m k) | Put s (m k)
  deriving (Functor)

-- get :: Has (State s) sig m => m s
-- put :: Has (State s) sig m => s -> m ()

newtype StateC s m a = StateC (s -> m (s, a))
  deriving (Functor)

-- runState :: s -> StateC s m a -> m (s, a)

-- Minimal Example

example1 :: Has (State Integer) sig m => m Integer
example1 = do
  modify (+ 1)
  modify (* 10)
  get

ex1 :: (Algebra sig m, Effect sig) => m Integer
ex1 = evalState (1 :: Integer) example1

run1 :: Identity Integer
run1 = runM ex1

run2 :: IO Integer
run2 = runM ex1

example2 :: (Has (State (Double, Double)) sig m, Has (Throw ArithException) sig m) => m Double
example2 = do
  (a, b) <- get
  if b == 0
    then throwError DivideByZero
    else pure (a / b)

ex2 :: (Algebra sig m, Effect sig) => m (Either ArithException Double)
ex2 = runThrow $ evalState (1 :: Double, 2 :: Double) example2

ex3 :: (Algebra sig m, Effect sig) => m (Either ArithException Double)
ex3 = evalState (1 :: Double, 0 :: Double) (runThrow example2)