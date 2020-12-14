{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE UndecidableInstances #-}

module Free where

import Prelude (Functor, Int, Show, fmap, show, ($), (++), (-), (.), (>))

{- Monads for free -}

data Free f a = Roll (f (Free f a)) | Return a

class Monad m where
  return :: a -> m a
  (>>=) :: m a -> (a -> m b) -> m b
  (>>) :: m a -> m b -> m b

instance Functor f => Functor (Free f) where
  fmap f (Roll x) = Roll $ fmap (fmap f) x
  fmap f (Return x) = Return (f x)

instance Functor f => Monad (Free f) where
  return = Return
  Return m >>= k = k m
  Roll m >>= k = Roll $ fmap (>>= k) m
  Return m >> Return k = Return k
  Roll m >> Roll k = Roll k

foldF :: Functor f => (f a -> a) -> Free f a -> a
foldF phi (Roll x) = phi $ fmap (foldF phi) x
foldF _ (Return x) = x

newtype Forall f = Forall {unforall :: forall a. f a}

cateF :: Functor f => (f a -> a) -> Forall (Free f) -> a
cateF phi = foldF phi . unforall

data Succ a = Succ a

instance Functor Succ where
  fmap f (Succ a) = Succ (f a)

instance (Show a, Show (f (Free f a))) => Show (Free f a) where
  show (Roll x) = "(Roll (" ++ show x ++ "))"
  show (Return x) = "(Return (" ++ show x ++ "))"

--

-- type Peano = Forall (Free Succ)

-- toNat :: Int -> Free Succ ()
-- toNat n | n > 0 = toNat (n - 1) >> Succ ()
-- toNat 0 = return ()
