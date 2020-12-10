{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module ReaderT' where

{- Reader -}

import Control.Monad.Reader (Reader)
import Control.Monad.Reader.Class (MonadReader (ask, local))
import Control.Monad.Trans (MonadTrans (..))

-- newtype Reader r a = Reader {runReader :: r -> a}

instance MonadReader r (Reader r) where
  ask = Reader id
  local f m = Reader (runReader m . f)

{- ReaderT -}

newtype ReaderT r m a = ReaderT {runReaderT :: r -> m a}

instance (Monad m) => Monad (ReaderT r m) where
  return a = ReaderT $ \_ -> return a
  m >>= k = ReaderT $ \r -> do
    a <- runReaderT m r
    runReaderT (k a) r

instance MonadTrans (ReaderT r) where
  lift m = ReaderT $ \_ -> m

{- MonadReader -}

class (Monad m) => MonadReader r m | m -> r where
  ask :: m r
  local :: (r -> r) -> m a -> m a

instance (Monad m) => ReaderT'.MonadReader r (ReaderT r m) where
  ask = ReaderT return
  local f m = ReaderT $ \_ -> runReaderT m (f r)