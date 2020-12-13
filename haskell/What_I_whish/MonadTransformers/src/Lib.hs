{-# LANGUAGE GeneralisedNewtypeDeriving #-}

module Lib
  (
  )
where

import Control.Monad.Morph
import Control.Monad.Reader
  ( MonadReader (ask, local),
    MonadTrans (lift),
    ReaderT (..),
  )
import Control.Monad.State
  ( MonadState,
    State,
    StateT,
    evalState,
    gets,
    modify,
  )
import Control.Monad.Writer

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

-- class (Monad m) => MonadIO m where
--   liftIO :: IO a -> m a

-- instance MonadIO IO where
--   liftIO = id

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

{- Newtype Deriving-}

-- Both have the same runtime representation as a text object,
-- but are distinguished statically, so that plaintext can not be accidentally
-- interchanged with encrypted text.

-- eg.
-- newtype Plaintext = Plaintext Text
-- newtype Crytpotext = Crytpotext Text
-- encrypt :: Key -> Plaintext -> Cryptotext
-- decrypt :: Key -> Cryptotext -> Plaintext

newtype Quantity v a = Quantity a
  deriving (Eq, Ord, Num, Show)

data Haskeller

type Haskellers = Quantity Haskeller Int

a :: Haskellers
a = Quantity 2 :: Haskellers

b :: Haskellers
b = Quantity 6 :: Haskellers

totalHaskellers :: Haskellers
totalHaskellers = a + b

newtype Velocity = Velocity {unVelocity :: Double}
  deriving (Eq, Ord)

v :: Velocity
v = Velocity 2.718

x :: Double
x = 2.718

-- err = v + x
-- Couldn't match type `Double' with `Velocity'
-- Expected type: Velocity
-- Actual type: Double
-- In the second argument of `(+)', namely `x'
-- In the expression: v + x

-- Using newtype deriving with the mtl library typeclasses we can produced flattened transformer types that
-- don't require explicit lifting in the transform stack

type Stack = [Int]

type Output = [Int]

type Program = [Instr]

type VM a = ReaderT Program (WriterT Output (State Stack)) a

newtype Comp a = Comp {unComp :: VM a}
  deriving (Functor, Applicative, Monad, MonadReader Program, MonadWriter Output, MonadState Stack)

data Instr = Push Int | Pop | Puts

evalInstr :: Instr -> Comp ()
evalInstr instr = case instr of
  Pop -> modify tail
  Push n -> modify (n :)
  Puts -> do
    tos <- gets head
    tell [tos]

eval' :: Comp ()
eval' = do
  instr <- ask
  case instr of
    [] -> return ()
    (i : is) -> evalInstr i >> local (const is) eval'

execVM :: Program -> Output
execVM = flip evalState [] . execWriterT . runReaderT (unComp eval')

program :: Program
program =
  [ Push 42,
    Push 27,
    Puts,
    Pop,
    Puts,
    Pop
  ]

main :: IO ()
main = mapM_ print $ execVM program

-- Pattern matching on a newtype constructor compiles into nothing.

data A = MKA Int

newtype B = MKB Int

extractA :: A -> Int
extractA (MKA x) = x

extractB :: B -> Int -- MKB doesn't exist at runtime; it is purely a compile-time construct
extractB (MKB x) = x

{- Efficiency -}

-- The second monad transformer law guarantees that sequencing consecutive lift operations
-- is semantically equivalent to lifting the results into the outer monad.

-- do x <- lift m == lift $ do x <- m
--     lift (f x)              f x

-- Less Efficient         More Efficient
-- forever (lift m)    == lift (forever m)
-- mapM_ (lift . f) xs == lift (mapM_ f xs)
-- forM_ xs (lift . f) == lift (forM_ xs f)

{- Monad Morphisms -}

-- The mmorph library provides the capacity to compose
-- monad morphism transformation directly on transformer stacks.

-- hoist :: Monad m => (forall a. m a -> n a) -> t m b -> t n b

-- The monad morphism generalize takes an Identity monad into any another monad m .

-- generalize :: MOnad m => Identity a -> m a

type Eval' a = State [Int] a

runEval' :: [Int] -> Eval' a -> a
runEval' = flip evalState

pop :: Eval' Int
pop = do
  top <- gets head
  modify tail
  return top

push :: Int -> Eval' ()
push x = modify (x :)

ev1 :: Eval' Int
ev1 = do
  push 3
  push 4
  pop
  pop

ev2 :: StateT [Int] IO ()
ev2 = do
  result <- hoist generalize ev1
  liftIO $ putStrLn $ "Result: " ++ show result

{- Effect Systems -}

-- Extensibility

-- instance MonadReader r m => MonadReader r (ExceptT e m) where
--   ask = lift ask
--   local = mapExceptT . local
--   reader = lift . reader

-- instance MonadReader r m => MonadReader r (IdentityT m) where
--   ask = lift ask
--   local = mapIdentityT . local
--   reader = lift . reader

-- Composing TRansformers

-- stateExcept :: StateT s (Except e) a -> s -> Either e (a, s)
-- stateExcept m s = runExcept (runStateT m s)

-- exceptState :: ExceptT e (State s) a -> s -> (Either e a, s)
-- exceptState m s = runState (runExceptT m) s