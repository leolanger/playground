module Lib
  (
  )
where

import Control.Monad.Reader hiding (MonadIO)

{- mtl/transformers -}

-- monad transformers allow us to nest monadic computations in a stack with an interface to exchange values
-- between the levels, called lift.
-- lift :: (Monad m, MonadTrans t) => m a -> t m a

-- Law 1.
-- lift . return = return

-- Law 2
-- lift (return x) = return

--Law 3
--     do x <- lift m
--         lift (f x)
--   = lift $ do x <- m
--         f x

{- Transformers -}

class MonadTrans t where
  lift :: Monad m => m a -> t m a

-- describe composing one monad with another monad
-- (the “t” is the transformed second monad)

class (Monad m) => MonadIO m where
  liftIO :: IO a -> m a

instance MonadIO IO where
  liftIO = id

{- Basics -}

-- Monad (m :: * -> *)
-- MonadTrans (t :: (* -> *) -> * -> *)

type Env = [(String, Int)]

type Eval a = ReaderT Env Maybe a

data Expr
  = Val Int
  | Add Expr Expr
  | Var String
  deriving (Show)

eval :: Expr -> Eval Int
eval ex = case ex of
  Val n -> return n
  Add x y -> do
    a <- eval x
    b <- eval y
    return (a + b)
  Var x -> do
    env <- ask
    val <- Control.Monad.Reader.lift (lookup x env)
    return val

env :: Env
env = [("x", 2), ("y", 5)]

ex1 :: Eval Int
ex1 = eval (Add (Val 2) (Add (Val 1) (Var "x")))

example1, example2 :: Maybe Int
example1 = runReaderT ex1 env
example2 = runReaderT ex1 []
