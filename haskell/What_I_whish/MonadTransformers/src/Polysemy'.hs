{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module Polysemy' where

import Polysemy
import Polysemy.Error
import Polysemy.State
import Polysemy.Trace

data MyError = MyError
  deriving (Show)

example2 :: Members '[Trace, State Example, Error MyError] r => sem r ()
example2 = do
  modify $ \s -> s {x = 1, y = 2}
  trace "foo"
  throw MyError
  pure ()

runExample2 :: IO ()
runExample2 = do
  result <-
    runFinal $
      embedToFinal @IO $
        errorToIOFinal @MyError $
          runState (Example 0 0) $
            traceToIO example2
  print result
