module Test.MyAppTest

import IdrTest.Test
import IdrTest.Expectation

import MyApp

export
suite : Test
suite =
  describe "MyApp Tests"
    [ test "1 == 1" (\_ => assertEq 1 1 )
    ]
