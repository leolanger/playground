module State where

{- State Monad -}

newtype State s a = State {runState :: s -> (a, s)}

instance Functor (State s) where
  fmap f (State x) = State $ \s ->
    let (a, s1) = x s
     in (f a, s1)

instance Applicative (State s) where
  pure x = State $ \s -> (x, s)
  (State f) <*> (State g) =
    State $ \s ->
      let (func, s1) = f s
          (val, s2) = g s1
       in (func val, s2)

instance Monad (State s) where
  return a = State $ \s -> (a, s)
  State act >>= k = State $ \s ->
    let (a, s1) = act s
     in runState (k a) s1

get :: State s s
get = State $ \s -> (s, s)

put :: s -> State s ()
put s = State $ \_ -> ((), s)

modify :: (s -> s) -> State s ()
modify f = get >>= \x -> put (f x)

evalState :: State s a -> s -> a
evalState act = fst . runState act

execState :: State s a -> s -> s
execState act = snd . runState act
