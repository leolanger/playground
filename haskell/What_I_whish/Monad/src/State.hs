module State where

{- State Monad -}

newtype State s a = State {runState :: s -> (a, s)}

instance Functor (State s) where
    fmap = 

instance Applicative (State s) where

instance Monad (State s) where
  return a = State $ \s -> (a, s)
  State act >>= k = State $ \s ->
    let (a, s') = act s
     in runState (k a) s'