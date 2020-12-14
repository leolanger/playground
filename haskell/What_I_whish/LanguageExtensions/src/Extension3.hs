{-# LANGUAGE Safe #-}

module Extension3 where

{- Safe Haskell -}

-- It also forbids the use of certain language extensions
-- ( -XTemplateHaskell ) which can be used to produce unsafe code.

import System.IO.Unsafe
import Unsafe.Coerce

bad1 :: String
bad1 = unsafePerformIO getLine

bad2 :: a
bad2 = unsafeCoerce 3.14 ()

-- Unsafe.Coerce: Can't be safely imported!
-- The module itself isn't safe.