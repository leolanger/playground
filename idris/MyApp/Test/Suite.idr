module Test.Suite

import IdrTest.Test

import Test.MyAppTest

suite : IO ()
suite = do
  runSuites
    [ Test.MyAppTest.suite
    ]
